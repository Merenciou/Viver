import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viver/controllers/user_model.dart';
import 'package:viver/custom_widgets/custom_timepicker.dart';
import 'package:viver/controllers/user_controller.dart';
import 'package:viver/custom_widgets/hours_slept.dart';
import 'package:viver/warnings/warnings.dart';

final TextEditingController ageController = TextEditingController();
int? hourIdealMin;
int? hourIdealMax;

class Sleep extends StatefulWidget {
  const Sleep({super.key});

  @override
  State<Sleep> createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  final _formKey = GlobalKey<FormState>();
  bool calcIsPressed = false;
  bool defineHourSleptIsPressed = false;
  List<dynamic> hourToSleep = [];
  double? age;

  void _getAge() async {
    age = await UserModel().getAge() ?? 0;
  }

  Future<void> loadJsonList() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('lib/assets/json_list_info/list.json');
    Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

    List<dynamic> hourToSleepList = jsonResponse['hourtosleep'];
    if (mounted) {
      setState(() {
        hourToSleep = hourToSleepList;
      });
    }
  }

  void getIdealHour() {
    double age = double.parse(ageController.text.replaceAll(',', '.'));

    switch (age) {
      case >= 0.01 && <= 0.03:
        setState(() {
          hourIdealMin = hourToSleep[0]['0at0.3'][0];
          hourIdealMax = hourToSleep[0]['0at0.3'][1];
        });
        break;
      case >= 0.04 && < 1:
        setState(() {
          hourIdealMin = hourToSleep[1]['0.4at0.11'][0];
          hourIdealMax = hourToSleep[1]['0.4at0.11'][1];
        });
        break;
      case >= 1 && <= 2:
        setState(() {
          hourIdealMin = hourToSleep[2]['1at2'][0];
          hourIdealMax = hourToSleep[2]['1at2'][1];
        });
        break;
      case >= 3 && <= 5:
        setState(() {
          hourIdealMin = hourToSleep[3]['3at5'][0];
          hourIdealMax = hourToSleep[3]['3at5'][1];
        });
        break;
      case >= 6 && <= 12:
        setState(() {
          hourIdealMin = hourToSleep[4]['6at12'][0];
          hourIdealMax = hourToSleep[4]['6at12'][1];
        });
        break;
      case >= 13 && <= 18:
        setState(() {
          hourIdealMin = hourToSleep[5]['13at18'][0];
          hourIdealMax = hourToSleep[5]['13at18'][1];
        });
        break;
      case >= 19 && <= 60:
        setState(() {
          hourIdealMin = hourToSleep[6]['19at60'][0];
          hourIdealMax = hourToSleep[6]['19at60'][1];
        });
        break;
      case >= 61 && <= 64:
        setState(() {
          hourIdealMin = hourToSleep[7]['61at64'][0];
          hourIdealMax = hourToSleep[7]['61at64'][1];
        });
        break;
      case >= 65:
        setState(() {
          hourIdealMin = hourToSleep[8]['65orMore'][0];
          hourIdealMax = hourToSleep[8]['65orMore'][1];
        });
        break;
      default:
    }
  }

  @override
  void initState() {
    loadJsonList();
    super.initState();
  }

  final GlobalKey<TooltipState> toolTipKey = GlobalKey<TooltipState>();

  void _onTooltipTap(GlobalKey tooltipKey) {
    final dynamic tooltip = tooltipKey.currentState;
    tooltip?.ensureTooltipVisible();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          defineHourSleptIsPressed
              ? const HoursSlept()
              : calcIsPressed
                  ? calcResult()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                              width: 250,
                              height: 250,
                              child: SvgPicture.asset(
                                  'lib/assets/images/sleeping.svg')),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Quantas horas de sono por noite você deve dormir?',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: ageController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                style: Theme.of(context).textTheme.labelSmall,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, preencha este campo!';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    label: Text(
                                      'Digite sua idade',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide.none),
                                    suffixIcon: Tooltip(
                                      key: toolTipKey,
                                      triggerMode: TooltipTriggerMode.manual,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      textAlign: TextAlign.center,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      message:
                                          'Para recém nascidos insira os meses dessa maneira: \n ex.: "0,02" (2 meses).',
                                      child: IconButton(
                                        onPressed: () {
                                          _onTooltipTap(toolTipKey);
                                        },
                                        icon: Icon(
                                          Icons.info,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                        ),
                                      ),
                                    )),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: CustomTimePicker(),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              getIdealHour();

                              setState(() {
                                calcIsPressed = true;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 50),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              backgroundColor: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme!
                                  .primary),
                          child: Text(
                            'Calcular',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                      ],
                    ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  _getAge();
                  if (age != null || age != 0) {
                    setState(() {
                      defineHourSleptIsPressed = !defineHourSleptIsPressed;
                    });
                  } else {
                    Warnings.snackBarAgeNull(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: defineHourSleptIsPressed
                        ? Theme.of(context).buttonTheme.colorScheme!.onSecondary
                        : Theme.of(context).buttonTheme.colorScheme!.onPrimary,
                    minimumSize: const Size(80, 80)),
                child: Icon(
                  defineHourSleptIsPressed
                      ? Icons.close_rounded
                      : Icons.bedtime,
                  color: defineHourSleptIsPressed ? Colors.white : Colors.white,
                  size: 35,
                ),
              ),
            ),
          )
        ],
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
                            setState(() {
                              calcIsPressed = false;
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
                            width: 200,
                            height: 110,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: SvgPicture.asset(
                              'lib/assets/images/sleep.svg',
                            )),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Você deve dormir',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('$hourIdealMin a $hourIdealMax',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge
                    // GoogleFonts.montserrat(
                    //     fontSize: 18, color: Colors.yellow),
                    ),
                Text(
                  'por noite!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Este é o seu resultado?',
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    UserController().setAge();
                    UserController().setWakeUpHour();
                    UserController().setHourIdealSleepMax();
                    setState(() {
                      calcIsPressed = false;
                    });
                    ageController.clear();
                    wakeUpHourController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: const RoundedRectangleBorder(),
                      backgroundColor:
                          Theme.of(context).buttonTheme.colorScheme!.onPrimary),
                  child: Text(
                    'Sim',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ageController.clear();
                    wakeUpHourController.clear();
                    setState(() {
                      calcIsPressed = false;
                    });
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
                    style: Theme.of(context).textTheme.titleLarge,
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
