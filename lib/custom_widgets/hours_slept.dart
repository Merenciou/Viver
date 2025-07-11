import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dot_loader/dot_loader.dart';
import 'package:viver/controllers/dark_theme_controller.dart';
import 'package:viver/controllers/user_model.dart';
import 'package:intl/intl.dart';
import 'package:viver/warnings/warnings.dart';

class HoursSlept extends StatefulWidget {
  const HoursSlept({super.key});

  @override
  State<HoursSlept> createState() => _HoursSleptState();
}

class _HoursSleptState extends State<HoursSlept> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TimeOfDay selectedTimeSlept = TimeOfDay.now();
  TimeOfDay selectedTimeWokeUp = TimeOfDay.now();
  late Future<String?> name;
  double? age;
  String hourSlept = '';
  String hourWokeUp = '';
  bool isLoading = false;
  bool showResult = false;
  int? hoursRemainings;
  int? minutesRemainings;
  String? hoursAndMinutes;

  void setSleepPerDay() async {
    final auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');
    DateTime now = DateTime.now().subtract(const Duration(days: 0));
    String dayNow = DateFormat('EEEE', 'en_US').format(now).toLowerCase();

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .collection('hourSleptPerDay')
          .doc('days')
          .set({dayNow: hoursAndMinutes}, SetOptions(merge: true));
    }
  }

  Future<void> getAge() async {
    try {
      age = await UserModel().getAge();
    } catch (e) {
      if (mounted) {
        Warnings.snackBarAgeNull(context);
      }
      age = null;
    }
  }

  @override
  void initState() {
    name = UserModel().getName();
    getAge();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              width: 360,
              decoration: BoxDecoration(
                color: DarkThemeController.instance.isDarkTheme
                    ? const Color(0xFF10375C)
                    : Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Form(
                key: formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        'lib/assets/images/how_night.svg',
                        width: 100,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color:
                                        DarkThemeController.instance.isDarkTheme
                                            ? Colors.white70
                                            : const Color(0xffF6F5F5),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10, bottom: 10),
                                      child: FutureBuilder(
                                          future: name,
                                          builder: (BuildContext context,
                                              AsyncSnapshot asyncSnapshot) {
                                            if (asyncSnapshot.connectionState ==
                                                ConnectionState.done) {
                                              if (asyncSnapshot.hasData) {
                                                return Text(
                                                  'Olá, ${asyncSnapshot.data} que horas você foi dormir?',
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.black38,
                                                      fontSize: 17),
                                                );
                                              } else {
                                                return Text(
                                                  'Olá, que horas você foi dormir?',
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.black38,
                                                      fontSize: 17),
                                                );
                                              }
                                            } else {
                                              return const CircularProgressIndicator();
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                              if (hourSlept == '')
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          TimeOfDay? timeOfDay =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: selectedTimeSlept,
                                            initialEntryMode:
                                                TimePickerEntryMode.dial,
                                            errorInvalidText:
                                                'Selecione um horário válido',
                                            confirmText: 'Selecionar',
                                            cancelText: 'Cancelar',
                                            helpText: 'Selecione a hora',
                                            hourLabelText: 'Horas',
                                            minuteLabelText: 'Minutos',
                                          );
                                          if (timeOfDay != null) {
                                            setState(() {
                                              selectedTimeSlept = timeOfDay;
                                              String hour = selectedTimeSlept
                                                  .hour
                                                  .toString();

                                              String minute = selectedTimeSlept
                                                  .minute
                                                  .toString();

                                              if (hour.length == 1) {
                                                setState(() {
                                                  hour = selectedTimeSlept.hour
                                                      .toString()
                                                      .padLeft(2, '0');
                                                });
                                              }

                                              if (minute.length == 1) {
                                                setState(() {
                                                  minute = selectedTimeSlept
                                                      .minute
                                                      .toString()
                                                      .padLeft(2, '0');
                                                });
                                              }

                                              hourSlept = '$hour:$minute';
                                            });
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Theme.of(context)
                                              .buttonTheme
                                              .colorScheme!
                                              .primary,
                                          minimumSize: const Size(100, 50),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Selecionar',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge,
                                        )),
                                  ),
                                )
                              else
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: GestureDetector(
                                      onTapDown: (details) async {
                                        TimeOfDay? timeOfDay =
                                            await showTimePicker(
                                          context: context,
                                          initialTime: selectedTimeWokeUp,
                                          initialEntryMode:
                                              TimePickerEntryMode.dial,
                                          errorInvalidText:
                                              'Selecione um horário válido',
                                          confirmText: 'Selecionar',
                                          cancelText: 'Cancelar',
                                          helpText: 'Selecione a hora',
                                          hourLabelText: 'Horas',
                                          minuteLabelText: 'Minutos',
                                        );
                                        if (timeOfDay != null) {
                                          setState(() {
                                            selectedTimeWokeUp = timeOfDay;
                                            String hour = selectedTimeWokeUp
                                                .hour
                                                .toString();

                                            String minute = selectedTimeWokeUp
                                                .minute
                                                .toString();

                                            if (hour.length == 1) {
                                              hour = selectedTimeWokeUp.hour
                                                  .toString()
                                                  .padLeft(2, '0');
                                            }

                                            if (minute.length == 1) {
                                              minute = selectedTimeWokeUp.minute
                                                  .toString()
                                                  .padLeft(2, '0');
                                            }

                                            hourWokeUp = '$hour:$minute';
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Center(
                                                child: Text(
                                                  hourSlept,
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontSize: 17),
                                                ),
                                              ),
                                              const Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Container(
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color:
                                        DarkThemeController.instance.isDarkTheme
                                            ? Colors.white70
                                            : const Color(0xffF6F5F5),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 90),
                                      child: Text(
                                        'Que horas você acordou?',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black38,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (hourWokeUp == '')
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        TimeOfDay? timeOfDay =
                                            await showTimePicker(
                                          context: context,
                                          initialTime: selectedTimeWokeUp,
                                          initialEntryMode:
                                              TimePickerEntryMode.dial,
                                          errorInvalidText:
                                              'Selecione um horário válido',
                                          confirmText: 'Selecionar',
                                          cancelText: 'Cancelar',
                                          helpText: 'Selecione a hora',
                                          hourLabelText: 'Horas',
                                          minuteLabelText: 'Minutos',
                                        );
                                        if (timeOfDay != null) {
                                          setState(() {
                                            selectedTimeWokeUp = timeOfDay;
                                            String hour = selectedTimeWokeUp
                                                .hour
                                                .toString();

                                            String minute = selectedTimeWokeUp
                                                .minute
                                                .toString();

                                            if (hour.length == 1) {
                                              hour = selectedTimeWokeUp.hour
                                                  .toString()
                                                  .padLeft(2, '0');
                                            }

                                            if (minute.length == 1) {
                                              minute = selectedTimeWokeUp.minute
                                                  .toString()
                                                  .padLeft(2, '0');
                                            }

                                            hourWokeUp = '$hour:$minute';
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context)
                                            .buttonTheme
                                            .colorScheme!
                                            .primary,
                                        minimumSize: const Size(100, 50),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Selecionar',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                    ),
                                  ),
                                )
                              else
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: GestureDetector(
                                      onTapDown: (details) async {
                                        TimeOfDay? timeOfDay =
                                            await showTimePicker(
                                          context: context,
                                          initialTime: selectedTimeWokeUp,
                                          initialEntryMode:
                                              TimePickerEntryMode.dial,
                                          errorInvalidText:
                                              'Selecione um horário válido',
                                          confirmText: 'Selecionar',
                                          cancelText: 'Cancelar',
                                          helpText: 'Selecione a hora',
                                          hourLabelText: 'Horas',
                                          minuteLabelText: 'Minutos',
                                        );
                                        if (timeOfDay != null) {
                                          setState(() {
                                            selectedTimeWokeUp = timeOfDay;
                                            String hour = selectedTimeWokeUp
                                                .hour
                                                .toString();

                                            String minute = selectedTimeWokeUp
                                                .minute
                                                .toString();

                                            if (hour.length == 1) {
                                              hour = selectedTimeWokeUp.hour
                                                  .toString()
                                                  .padLeft(2, '0');
                                            }

                                            if (minute.length == 1) {
                                              minute = selectedTimeWokeUp.minute
                                                  .toString()
                                                  .padLeft(2, '0');
                                            }

                                            hourWokeUp = '$hour:$minute';
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Center(
                                                child: Text(
                                                  hourWokeUp,
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontSize: 17),
                                                ),
                                              ),
                                              const Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (isLoading == true)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: DotedLoader(
                                    count: 3,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              if (showResult == true)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF6F5F5),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        hoursRemainings == 0 &&
                                                minutesRemainings == 0
                                            ? 'Você é um robô? Você não dorme?'
                                            : 'Você dormiu por $hoursRemainings horas e $minutesRemainings minutos',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black38,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (age != null) {
                              if (hourSlept != '' && hourWokeUp != '') {
                                int? hourWokeUpInt =
                                    int.tryParse(hourWokeUp.substring(0, 2));
                                int? minuteWokeUpInt =
                                    int.tryParse(hourWokeUp.substring(3, 5));
                                int? hourSleptInt =
                                    int.tryParse(hourSlept.substring(0, 2));
                                int? minuteSleptInt =
                                    int.tryParse(hourSlept.substring(3, 5));

                                int? minutesWokeUp =
                                    hourWokeUpInt! * 60 + minuteWokeUpInt!;
                                int? minutesSlept =
                                    hourSleptInt! * 60 + minuteSleptInt!;

                                int? remainingMinutes =
                                    minutesWokeUp - minutesSlept;

                                if (remainingMinutes < 0) {
                                  remainingMinutes += 24 * 60;
                                }

                                hoursRemainings = remainingMinutes ~/ 60;
                                minutesRemainings = remainingMinutes % 60;

                                hoursAndMinutes =
                                    '$hoursRemainings.$minutesRemainings';
                              }

                              if (mounted) {
                                setState(() {
                                  isLoading = true;
                                });
                              }

                              Future.delayed(const Duration(seconds: 3), () {
                                if (mounted) {
                                  setState(() {
                                    isLoading = false;
                                    if (hourSlept != '' && hourWokeUp != '') {
                                      setSleepPerDay();
                                      if (mounted) {
                                        Warnings.snackBarHourSleptSucessful(
                                            context);
                                      }

                                      showResult = true;
                                    } else {
                                      if (mounted) {
                                        Warnings.snackBarHoursNulls(context);
                                      }
                                    }
                                  });
                                }
                              });
                            } else {
                              Warnings.snackBarAgeNull(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              backgroundColor: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme!
                                  .primary),
                          child: Text(
                            'Relatar',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
