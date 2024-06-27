import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viver/controllers/chart_sleep_model.dart';
import 'package:viver/controllers/user_model.dart';
import 'package:viver/custom_widgets/chartbar_hydration.dart';
import 'package:viver/custom_widgets/chartbar_sleep.dart';

bool chartIndex = true;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<String?> futureName;
  DateTime time = DateTime.now();
  String salutation = '';
  List<String> dayShift = [
    'Bom dia, ',
    'Boa tarde, ',
    'Boa noite, ',
  ];

  void shiftSalutation() {
    if (time.hour >= 0 && time.hour <= 5) {
      setState(() {
        salutation = dayShift[2];
      });
    }
    if (time.hour >= 6 && time.hour <= 12) {
      setState(() {
        salutation = dayShift[0];
      });
    }
    if (time.hour >= 13 && time.hour <= 18) {
      setState(() {
        salutation = dayShift[1];
      });
    }
    if (time.hour >= 19 && time.hour <= 24) {
      setState(() {
        salutation = dayShift[2];
      });
    }
  }

  String? sleepGoalDiary;
  String? sleepGoalWeekly;
  double? hydrationGoalDiary;
  double? hydrationGoalWeekly;

  void _sleepGoalDiary() async {
    double? hoursSlept;
    int? hoursToSleep;

    ChartSleepModel().getWednesday().listen((value) {
      hoursSlept = value;
    }, onError: (error) {
      hoursSlept = 0;
    });
    hoursToSleep = await UserModel().getHourIdealSleepMax() ?? 0;

    double? sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep) * 100);
    sleepGoalDiary = sleepGoalDiaryCalc.toStringAsFixed(0);
  }

  void _sleepGoalWeekly() async {
    double? monday = 0;
    double? tuesday = 0;
    double? wednesday = 0;
    double? thursday = 0;
    double? friday = 0;
    double? saturday = 0;
    double? sunday = 0;
    int? hoursToSleepWeekly;

    hoursToSleepWeekly = (await UserModel().getHourIdealSleepMax() ?? 0) * 7;

    ChartSleepModel().getMonday().listen((value) {
      setState(() {
        monday = value;
      });
    }, onError: (error) {
      setState(() {
        monday = 0;
      });
    });
    ChartSleepModel().getTuesday().listen((value) {
      setState(() {
        tuesday = value;
      });
    }, onError: (error) {
      setState(() {
        tuesday = 0;
      });
    });
    ChartSleepModel().getWednesday().listen((value) {
      setState(() {
        wednesday = value;
      });
    }, onError: (error) {
      setState(() {
        wednesday = 0;
      });
    });
    ChartSleepModel().getThursday().listen((value) {
      setState(() {
        thursday = value;
      });
    }, onError: (error) {
      setState(() {
        thursday = 0;
      });
    });
    ChartSleepModel().getFriday().listen((value) {
      setState(() {
        friday = value;
      });
    }, onError: (error) {
      setState(() {
        friday = 0;
      });
    });
    ChartSleepModel().getSaturday().listen((value) {
      setState(() {
        saturday = value;
      });
    }, onError: (error) {
      setState(() {
        saturday = 0;
      });
    });
    ChartSleepModel().getSunday().listen((value) {
      setState(() {
        sunday = value;
      });
    }, onError: (error) {
      setState(() {
        sunday = 0;
      });
    });

    double? sleepGoalWeeklyCalc = ((monday! +
                tuesday! +
                wednesday! +
                thursday! +
                friday! +
                saturday! +
                sunday!) /
            hoursToSleepWeekly) *
        100;

    sleepGoalWeekly = sleepGoalWeeklyCalc.toStringAsFixed(0);
    print('a meta foi cumprida: $sleepGoalWeekly%');
  }

  void hydrationGoal() async {}

  var screenReportIndex = 0;

  void getChartIndex() {
    if (screenReportIndex == 0) {
      setState(() {
        chartIndex = true;
        print('O INDEX É: $chartIndex');
      });

      if (screenReportIndex == 1) {
        setState(() {
          chartIndex == false;
          print('O INDEX É: $chartIndex');
        });
      }
    }
  }

  List<Widget> screenReportList(BuildContext context) {
    return [
      reportSleep(),
      reportWater(),
    ];
  }

  @override
  void initState() {
    shiftSalutation();
    futureName = UserModel().getName();
    _sleepGoalDiary();
    _sleepGoalWeekly();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return screenReportList(context)[screenReportIndex];
  }

  Widget reportSleep() {
    return Stack(
      children: [
        Positioned(
          right: -6,
          top: 410,
          child: IconButton(
            onPressed: () {
              setState(() {
                screenReportIndex = 1;
              });
            },
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Theme.of(context).colorScheme.secondary,
              size: 60,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: SvgPicture.asset('lib/assets/images/sun.svg'),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: FutureBuilder(
                      future: futureName,
                      builder: (BuildContext context,
                          AsyncSnapshot<String?> asyncSnapshot) {
                        if (asyncSnapshot.connectionState ==
                            ConnectionState.done) {
                          if (asyncSnapshot.hasData) {
                            return RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: salutation,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                  ),
                                  TextSpan(
                                    text: asyncSnapshot.data,
                                    style: GoogleFonts.montserrat(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Text(
                              salutation,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24),
                            );
                          }
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Relatório semanal do seu sono:',
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const SleepChartBar(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 152,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.percent_rounded,
                              size: 38,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            Text(
                              '$sleepGoalDiary%',
                              style: GoogleFonts.montserrat(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Meta de\nsono\n(diário)',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 152,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.percent_rounded,
                              size: 38,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            Text(
                              '$sleepGoalWeekly%',
                              style: GoogleFonts.montserrat(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Meta de\nsono\n(semanal)',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mood_rounded,
                          size: 38,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        Text(
                          'Qualidade de sono',
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Ótimo',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              screenReportIndex = 0;
                            });
                          },
                          icon: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 15,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              screenReportIndex = 1;
                            });
                          },
                          icon: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget reportWater() {
    return Stack(
      children: [
        Positioned(
          left: -6,
          top: 410,
          child: IconButton(
            onPressed: () {
              setState(() {
                screenReportIndex = 0;
              });
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Theme.of(context).colorScheme.secondary,
              size: 60,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: SvgPicture.asset(
                      'lib/assets/images/water.svg',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Bom dia, ',
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                          ),
                          TextSpan(
                            text: 'Vitor',
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Relatório semanal de sua hidratação:',
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const HydrationChartBar(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 152,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.percent_rounded,
                              size: 38,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            Text(
                              '89%',
                              style: GoogleFonts.montserrat(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Meta de\nhidratação\n(diária)',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 152,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.percent_rounded,
                              size: 38,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            Text(
                              '83%',
                              style: GoogleFonts.montserrat(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Meta de\nhidratação\n(semanal)',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mood_rounded,
                          size: 38,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        Text(
                          'Nível de Hidratação',
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Bom',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              screenReportIndex = 0;
                            });
                          },
                          icon: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              screenReportIndex = 1;
                            });
                          },
                          icon: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
