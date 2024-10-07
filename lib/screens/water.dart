import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:viver/controllers/user_model.dart';
import 'package:viver/custom_widgets/clock.dart';
import 'package:viver/custom_widgets/treatment_null.dart';
import 'package:viver/notifications/notifications.dart';
import 'package:viver/controllers/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController weightController = TextEditingController();
bool stateAlarm = false;
bool nullVerifier = false;

Future<bool> getStateAlarm() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  bool stateAlarm = prefs.getBool('stateAlarmHydration') ?? false;
  return stateAlarm;
}

class NullVerifierProvider with ChangeNotifier {
  bool _nullVerifier = false;

  bool get nullVerifier => _nullVerifier;

  void setNullVerifier(bool value) {
    _nullVerifier = value;
    notifyListeners();
  }
}

class WaterPage extends StatefulWidget {
  const WaterPage({super.key});

  @override
  State<WaterPage> createState() => _WaterPage();
}

class _WaterPage extends State<WaterPage> {
  bool dialogBox = false;
  final _formKey = GlobalKey<FormState>();
  double? waterIdeal;
  String hourWakeUp = '00:00';

  void calculator() {
    dynamic weight = double.parse(weightController.text.replaceAll(',', '.'));
    waterIdeal = weight * 0.350 / 10;
  }

  void getHourWakeUp() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference userCollection = firestore.collection('Users');
    User? user = auth.currentUser;

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic>? data =
              documentSnapshot.data() as Map<String, dynamic>;
          if (mounted) {
            setState(() {
              hourWakeUp = data['wakeUpHour'] ?? '00:00';
            });
          }
        }
      });
    }
  }

  @override
  void initState() {
    getHourWakeUp();
    getStateAlarm().then((value) {
      setState(() {
        stateAlarm = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NullVerifierProvider>(
        builder: (context, provider, child) {
          if (provider._nullVerifier) {
            return const TreatmentNull();
          } else {
            return dialogBox
                ? calcResult()
                : Center(
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Clock(),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Defina um lembrete para beber água:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(30))),
                                      width: 350,
                                      height: 90,
                                      child: Center(
                                        child: SwitchListTile(
                                          title: Text(
                                            stateAlarm
                                                ? 'Ativado'
                                                : 'Desativado',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                          secondary: Text(hourWakeUp,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium),
                                          inactiveThumbColor: Colors.black38,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          inactiveTrackColor: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          trackOutlineColor:
                                              const WidgetStatePropertyAll(
                                                  Colors.transparent),
                                          value: stateAlarm,
                                          onChanged: (details) async {
                                            setState(() {
                                              stateAlarm = !stateAlarm;
                                            });

                                            final SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();

                                            await prefs.setBool(
                                                'stateAlarmHydration',
                                                stateAlarm);

                                            String? wakeUpHour =
                                                await UserModel()
                                                    .getWakeUpHour();
                                            double? age =
                                                await UserModel().getAge();
                                            double? weight =
                                                await UserModel().getWeight();

                                            if (wakeUpHour == null) {
                                              setState(() {
                                                stateAlarm = false;
                                                provider.setNullVerifier(true);
                                              });
                                            }
                                            if (age == null) {
                                              setState(() {
                                                stateAlarm = false;
                                                provider.setNullVerifier(true);
                                              });
                                            }
                                            if (weight == null) {
                                              setState(() {
                                                stateAlarm = false;
                                                provider.setNullVerifier(true);
                                              });
                                            }

                                            if (stateAlarm) {
                                              await NotificationController
                                                  .scheduleHydrationNotification();
                                            } else {
                                              await AwesomeNotifications()
                                                  .cancelNotificationsByChannelKey(
                                                      'hydration_channel');
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Quantidade ideal de água a ser ingerida por dia:',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      controller: weightController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ops, digite o seu peso! :)';
                                        }
                                        return null;
                                      },
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide.none),
                                        label: Text(
                                          'Digite o seu peso:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 14),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            dialogBox = true;
                                          });

                                          calculator();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          minimumSize: const Size(200, 60),
                                          backgroundColor: Theme.of(context)
                                              .buttonTheme
                                              .colorScheme!
                                              .primary),
                                      child: Text(
                                        'Calcular',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
          }
        },
      ),
    );
  }

  Widget calcResult() {
    return Align(
      child: Container(
        width: 350,
        height: 450,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                        child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            weightController.clear();
                            setState(() {
                              dialogBox = false;
                            });
                          },
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Color(0xFFFFFFFF),
                            size: 36,
                          )),
                    )),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Container(
                            width: 110,
                            height: 110,
                            decoration: const BoxDecoration(
                                color: Color(0xFFA2D5F2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: SvgPicture.asset(
                                'lib/assets/images/water.svg')),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Você deve ingerir',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 20, color: Colors.black87),
                ),
                Text(
                  '${waterIdeal?.toStringAsFixed(2)} litros'
                      .replaceAll('.', ','),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 20, color: Colors.yellow),
                ),
                Text(
                  'de água por dia!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Este é o seu peso?',
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    UserController().setWeight();
                    UserController().setWaterIdeal();
                    weightController.clear();
                    setState(() {
                      dialogBox = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: const RoundedRectangleBorder(),
                      backgroundColor:
                          Theme.of(context).buttonTheme.colorScheme!.onPrimary),
                  child: Text(
                    'Sim',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      dialogBox = false;
                    });
                    weightController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      backgroundColor: Theme.of(context)
                          .buttonTheme
                          .colorScheme!
                          .onSecondary),
                  child: Text(
                    'Não',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
