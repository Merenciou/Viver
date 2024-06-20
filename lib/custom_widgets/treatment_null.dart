import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:viver/controllers/user_controller.dart';
import 'package:viver/controllers/user_model.dart';
import 'package:viver/custom_widgets/custom_timepicker.dart';
import 'package:viver/screens/water.dart';

final TextEditingController _ageController = TextEditingController();
final TextEditingController _weightController = TextEditingController();
String? wakeUpHour;
double? age;
double? weight;

bool? isWakeUpHourNull;
bool? isAgeNull;
bool? isWeightNull;

void validateNull() {
  final UserController userController = UserController();
  if (wakeUpHour == null) {
    userController.setWakeUpHour();
  }
  if (age == null) {
    userController.age = double.tryParse(_ageController.text);

    userController.setAge();
  }
  if (weight == null) {
    userController.weight = double.tryParse(_weightController.text);
    userController.setWeight();
  }
}

Future<void> initializeNullProperties() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  if (user != null) {
    wakeUpHour = await UserModel().getWakeUpHour();
    age = await UserModel().getAge();
    weight = await UserModel().getWeight();

    if (wakeUpHour == null) {
      isWakeUpHourNull = true;
    }
    if (age == null) {
      isAgeNull = true;
    }
    if (weight == null) {
      isWeightNull = true;
    }
  }
}

class TreatmentNull extends StatefulWidget {
  const TreatmentNull({super.key});

  @override
  State<TreatmentNull> createState() => _TreatmentNullState();
}

class _TreatmentNullState extends State<TreatmentNull> with ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    initializeNullProperties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: SvgPicture.asset('lib/assets/images/water.svg'),
                  ),
                ),
                Text(
                  'Antes de continuar,\n responda algumas perguntas:',
                  style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width: 350,
                      child: Column(children: [
                        FutureBuilder(
                            future: initializeNullProperties(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasData) {
                                  return const Text(
                                      'Seus dados estão atualizados');
                                } else {
                                  return Column(
                                    children: [
                                      if (isWakeUpHourNull == true)
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: CustomTimePicker(),
                                        ),
                                      if (isAgeNull == true)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: TextFormField(
                                            controller: _ageController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Ops, preencha este campo! :)';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              label: Text(
                                                'Qual a sua idade?',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black38),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (isWeightNull == true)
                                        TextFormField(
                                          controller: _weightController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Ops, preencha este campo! :)';
                                            }
                                            return null;
                                          },
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            label: Text(
                                              'Qual o seu peso?',
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.black38),
                                            ),
                                            border: const OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                        )
                                    ],
                                  );
                                }
                              } else {
                                return const CircularProgressIndicator();
                              }
                            })
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          validateNull();
                          Provider.of<NullVerifierProvider>(context,
                                  listen: false)
                              .setNullVerifier(false);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiary,
                          minimumSize: const Size(200, 60),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      child: Text(
                        'Continuar',
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 18),
                      )),
                ),
                Container(
                  width: 300,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        'Estas informações serão utilizadas somente para cálculos internos, como por exemplo a quantidade de água ingerida, intervalo e etc...',
                        style: GoogleFonts.montserrat(color: Colors.black45),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _TreatmentNullState().dispose();
    super.dispose();
  }
}
