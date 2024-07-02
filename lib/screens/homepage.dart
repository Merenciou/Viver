import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viver/controllers/chart_hydration_model.dart';
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
    if (time.hour >= 19 && time.hour <= 23) {
      setState(() {
        salutation = dayShift[2];
      });
    }
  }

  String? sleepGoalDiary;
  String? sleepGoalWeekly;
  String? hydrationGoalDiary;
  String? hydrationGoalWeekly;
  String? sleepQuality;
  String? sleepQualityMood;
  String? hydrationQuality;
  String? hydrationQualityMood;
  Color? sleepColorMood;
  Color? hydrationColorMood;

  List<String> qualities = [
    'Ótimo',
    'Bom',
    'Razoável',
    'Ruim',
  ];

  List<String> qualitiesMoods = [
    'mood_great',
    'mood_good',
    'mood_reasonable',
    'mood_bad',
  ];

  List<Color> colorsMoods = [
    const Color(0XFF79AC78),
    const Color(0xFF40A2E3),
    const Color(0xFFD37676),
  ];

  void _sleepGoalDiary() async {
    double? hoursSlept;
    int? hoursToSleep;
    double? sleepGoalDiaryCalc;
    int? sleepGoalDiaryInt;
    DateTime today = DateTime.now();

    hoursToSleep = await UserModel().getHourIdealSleepMax() ?? 0;

    ChartSleepModel().getMonday().listen((value) {
      if (today.day == 1) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep!) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);
        sleepGoalDiaryInt = int.tryParse(sleepGoalDiary!);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              sleepQuality = qualities[3];
              sleepQualityMood = qualitiesMoods[3];
              sleepColorMood = colorsMoods[2];
            });

            break;
          case >= 26 && <= 50:
            setState(() {
              sleepQuality = qualities[2];
              sleepQualityMood = qualitiesMoods[2];
              sleepColorMood = colorsMoods[1];
            });

            break;
          case >= 51 && <= 75:
            setState(() {
              sleepQuality = qualities[1];
              sleepQualityMood = qualitiesMoods[1];
              sleepColorMood = colorsMoods[0];
            });

            break;
          case >= 76 && <= 100:
            setState(() {
              sleepQuality = qualities[0];
              sleepQualityMood = qualitiesMoods[0];
              sleepColorMood = colorsMoods[0];
            });

            break;
          default:
        }
      }
    }, onError: (error) {
      hoursSlept = 0;
    });

    ChartSleepModel().getTuesday().listen((value) {
      if (today.day == 2) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep!) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              sleepQuality = qualities[3];
              sleepQualityMood = qualitiesMoods[3];
              sleepColorMood = colorsMoods[2];
            });

            break;
          case >= 26 && <= 50:
            setState(() {
              sleepQuality = qualities[2];
              sleepQualityMood = qualitiesMoods[2];
              sleepColorMood = colorsMoods[1];
            });

            break;
          case >= 51 && <= 75:
            setState(() {
              sleepQuality = qualities[1];
              sleepQualityMood = qualitiesMoods[1];
              sleepColorMood = colorsMoods[0];
            });

            break;
          case >= 76 && <= 100:
            setState(() {
              sleepQuality = qualities[0];
              sleepQualityMood = qualitiesMoods[0];
              sleepColorMood = colorsMoods[0];
            });

            break;
          default:
        }
      }
    }, onError: (error) {
      hoursSlept = 0;
    });
    ChartSleepModel().getWednesday().listen((value) {
      if (today.day == 3) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep!) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              sleepQuality = qualities[3];
              sleepQualityMood = qualitiesMoods[3];
              sleepColorMood = colorsMoods[2];
            });

            break;
          case >= 26 && <= 50:
            setState(() {
              sleepQuality = qualities[2];
              sleepQualityMood = qualitiesMoods[2];
              sleepColorMood = colorsMoods[1];
            });

            break;
          case >= 51 && <= 75:
            setState(() {
              sleepQuality = qualities[1];
              sleepQualityMood = qualitiesMoods[1];
              sleepColorMood = colorsMoods[0];
            });

            break;
          case >= 76 && <= 100:
            setState(() {
              sleepQuality = qualities[0];
              sleepQualityMood = qualitiesMoods[0];
              sleepColorMood = colorsMoods[0];
            });

            break;
          default:
        }
      }
    }, onError: (error) {
      hoursSlept = 0;
    });
    ChartSleepModel().getThursday().listen((value) {
      if (today.day == 4) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep!) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              sleepQuality = qualities[3];
              sleepQualityMood = qualitiesMoods[3];
              sleepColorMood = colorsMoods[2];
            });

            break;
          case >= 26 && <= 50:
            setState(() {
              sleepQuality = qualities[2];
              sleepQualityMood = qualitiesMoods[2];
              sleepColorMood = colorsMoods[1];
            });

            break;
          case >= 51 && <= 75:
            setState(() {
              sleepQuality = qualities[1];
              sleepQualityMood = qualitiesMoods[1];
              sleepColorMood = colorsMoods[0];
            });

            break;
          case >= 76 && <= 100:
            setState(() {
              sleepQuality = qualities[0];
              sleepQualityMood = qualitiesMoods[0];
              sleepColorMood = colorsMoods[0];
            });

            break;
          default:
        }
      }
    }, onError: (error) {
      hoursSlept = 0;
    });
    ChartSleepModel().getFriday().listen((value) {
      if (today.day == 5) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep!) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              sleepQuality = qualities[3];
              sleepQualityMood = qualitiesMoods[3];
              sleepColorMood = colorsMoods[2];
            });

            break;
          case >= 26 && <= 50:
            setState(() {
              sleepQuality = qualities[2];
              sleepQualityMood = qualitiesMoods[2];
              sleepColorMood = colorsMoods[1];
            });

            break;
          case >= 51 && <= 75:
            setState(() {
              sleepQuality = qualities[1];
              sleepQualityMood = qualitiesMoods[1];
              sleepColorMood = colorsMoods[0];
            });

            break;
          case >= 76 && <= 100:
            setState(() {
              sleepQuality = qualities[0];
              sleepQualityMood = qualitiesMoods[0];
              sleepColorMood = colorsMoods[0];
            });

            break;
          default:
        }
      }
    }, onError: (error) {
      hoursSlept = 0;
    });
    ChartSleepModel().getSaturday().listen((value) {
      if (today.day == 6) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep!) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              sleepQuality = qualities[3];
              sleepQualityMood = qualitiesMoods[3];
              sleepColorMood = colorsMoods[2];
            });

            break;
          case >= 26 && <= 50:
            setState(() {
              sleepQuality = qualities[2];
              sleepQualityMood = qualitiesMoods[2];
              sleepColorMood = colorsMoods[1];
            });

            break;
          case >= 51 && <= 75:
            setState(() {
              sleepQuality = qualities[1];
              sleepQualityMood = qualitiesMoods[1];
              sleepColorMood = colorsMoods[0];
            });

            break;
          case >= 76 && <= 100:
            setState(() {
              sleepQuality = qualities[0];
              sleepQualityMood = qualitiesMoods[0];
              sleepColorMood = colorsMoods[0];
            });

            break;
          default:
        }
      }
    }, onError: (error) {
      hoursSlept = 0;
    });
    ChartSleepModel().getSunday().listen((value) {
      if (today.day == 0) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep!) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              sleepQuality = qualities[3];
              sleepQualityMood = qualitiesMoods[3];
              sleepColorMood = colorsMoods[2];
            });

            break;
          case >= 26 && <= 50:
            setState(() {
              sleepQuality = qualities[2];
              sleepQualityMood = qualitiesMoods[2];
              sleepColorMood = colorsMoods[1];
            });

            break;
          case >= 51 && <= 75:
            setState(() {
              sleepQuality = qualities[1];
              sleepQualityMood = qualitiesMoods[1];
              sleepColorMood = colorsMoods[0];
            });

            break;
          case >= 76 && <= 100:
            setState(() {
              sleepQuality = qualities[0];
              sleepQualityMood = qualitiesMoods[0];
              sleepColorMood = colorsMoods[0];
            });

            break;
          default:
        }
      }
    }, onError: (error) {
      hoursSlept = 0;
    });
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
    double? sleepGoalWeeklyCalc;

    hoursToSleepWeekly = (await UserModel().getHourIdealSleepMax() ?? 0) * 7;

    ChartSleepModel().getMonday().listen((value) {
      setState(() {
        monday = value;
        sleepGoalWeeklyCalc = ((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                hoursToSleepWeekly!) *
            100;

        sleepGoalWeekly = sleepGoalWeeklyCalc!.toStringAsFixed(0);
      });
    }, onError: (error) {
      setState(() {
        monday = 0;
      });
    });
    ChartSleepModel().getTuesday().listen((value) {
      setState(() {
        tuesday = value;
        sleepGoalWeeklyCalc = ((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                hoursToSleepWeekly!) *
            100;

        sleepGoalWeekly = sleepGoalWeeklyCalc!.toStringAsFixed(0);
      });
    }, onError: (error) {
      setState(() {
        tuesday = 0;
      });
    });
    ChartSleepModel().getWednesday().listen((value) {
      setState(() {
        wednesday = value;
        sleepGoalWeeklyCalc = ((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                hoursToSleepWeekly!) *
            100;

        sleepGoalWeekly = sleepGoalWeeklyCalc!.toStringAsFixed(0);
      });
    }, onError: (error) {
      setState(() {
        wednesday = 0;
      });
    });
    ChartSleepModel().getThursday().listen((value) {
      setState(() {
        thursday = value;
        sleepGoalWeeklyCalc = ((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                hoursToSleepWeekly!) *
            100;

        sleepGoalWeekly = sleepGoalWeeklyCalc!.toStringAsFixed(0);
      });
    }, onError: (error) {
      setState(() {
        thursday = 0;
      });
    });
    ChartSleepModel().getFriday().listen((value) {
      setState(() {
        friday = value;
        sleepGoalWeeklyCalc = ((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                hoursToSleepWeekly!) *
            100;

        sleepGoalWeekly = sleepGoalWeeklyCalc!.toStringAsFixed(0);
      });
    }, onError: (error) {
      setState(() {
        friday = 0;
      });
    });
    ChartSleepModel().getSaturday().listen((value) {
      setState(() {
        saturday = value;
        sleepGoalWeeklyCalc = ((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                hoursToSleepWeekly!) *
            100;

        sleepGoalWeekly = sleepGoalWeeklyCalc!.toStringAsFixed(0);
      });
    }, onError: (error) {
      setState(() {
        saturday = 0;
      });
    });
    ChartSleepModel().getSunday().listen((value) {
      setState(() {
        sunday = value;
        sleepGoalWeeklyCalc = ((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                hoursToSleepWeekly!) *
            100;

        sleepGoalWeekly = sleepGoalWeeklyCalc!.toStringAsFixed(0);
      });
    }, onError: (error) {
      setState(() {
        sunday = 0;
      });
    });
  }

  void _hydrationGoalDiary() async {
    double? waterIngested;
    double? waterToIngest;
    double? hydrationGoalDiaryCalc;
    int? hydrationGoalDiaryInt;
    DateTime today = DateTime.now();

    waterToIngest = await UserModel().getWaterIdeal() ?? 0;

    ChartHydrationModel().getMonday().listen((value) {
      if (today.day == 1) {
        waterIngested = value;
        hydrationGoalDiaryCalc =
            (((waterIngested ?? 0) / waterToIngest!) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[2];
            });
            break;
          case >= 26 && <= 50:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[1];
            });
            break;
          case >= 51 && <= 75:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
          case >= 76 && <= 100:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });

    ChartHydrationModel().getTuesday().listen((value) {
      if (today.day == 2) {
        waterIngested = value;
        hydrationGoalDiaryCalc =
            (((waterIngested ?? 0) / waterToIngest!) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[2];
            });
            break;
          case >= 26 && <= 50:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[1];
            });
            break;
          case >= 51 && <= 75:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
          case >= 76 && <= 100:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });

    ChartHydrationModel().getWednesday().listen((value) {
      if (today.day == 3) {
        waterIngested = value;
        hydrationGoalDiaryCalc =
            (((waterIngested ?? 0) / waterToIngest!) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[2];
            });
            break;
          case >= 26 && <= 50:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[1];
            });
            break;
          case >= 51 && <= 75:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
          case >= 76 && <= 100:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });

    ChartHydrationModel().getThursday().listen((value) {
      if (today.day == 4) {
        waterIngested = value;
        hydrationGoalDiaryCalc =
            (((waterIngested ?? 0) / waterToIngest!) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[2];
            });
            break;
          case >= 26 && <= 50:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[1];
            });
            break;
          case >= 51 && <= 75:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
          case >= 76 && <= 100:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });

    ChartHydrationModel().getFriday().listen((value) {
      if (today.day == 5) {
        waterIngested = value;
        hydrationGoalDiaryCalc =
            (((waterIngested ?? 0) / waterToIngest!) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[2];
            });
            break;
          case >= 26 && <= 50:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[1];
            });
            break;
          case >= 51 && <= 75:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
          case >= 76 && <= 100:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });

    ChartHydrationModel().getSaturday().listen((value) {
      if (today.day == 6) {
        waterIngested = value;
        hydrationGoalDiaryCalc =
            (((waterIngested ?? 0) / waterToIngest!) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[2];
            });
            break;
          case >= 26 && <= 50:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[1];
            });
            break;
          case >= 51 && <= 75:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
          case >= 76 && <= 100:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });

    ChartHydrationModel().getSunday().listen((value) {
      if (today.day == 0) {
        waterIngested = value;
        hydrationGoalDiaryCalc =
            (((waterIngested ?? 0) / waterToIngest!) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[2];
            });
            break;
          case >= 26 && <= 50:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[1];
            });
            break;
          case >= 51 && <= 75:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
          case >= 76 && <= 100:
            setState(() {
              hydrationQuality = qualities[3];
              hydrationQualityMood = qualitiesMoods[3];
              hydrationColorMood = colorsMoods[0];
            });
            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });
  }

  void _hydrationGoalWeekly() async {
    double? monday = 0;
    double? tuesday = 0;
    double? wednesday = 0;
    double? thursday = 0;
    double? friday = 0;
    double? saturday = 0;
    double? sunday = 0;
    double? waterToIngestWeekly;
    double? hydrationGoalWeeklyCalc;

    waterToIngestWeekly = (await UserModel().getWaterIdeal() ?? 0) * 7;

    ChartHydrationModel().getMonday().listen((value) {
      setState(() {
        monday = value;
        hydrationGoalWeeklyCalc = (((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                waterToIngestWeekly!) *
            100);
        hydrationGoalWeekly =
            hydrationGoalWeeklyCalc!.toStringAsFixed(0).toString();
      });
    }, onError: (error) {
      setState(() {
        monday = 0;
      });
    });

    ChartHydrationModel().getTuesday().listen((value) {
      setState(() {
        tuesday = value;
        hydrationGoalWeeklyCalc = (((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                waterToIngestWeekly!) *
            100);
        hydrationGoalWeekly =
            hydrationGoalWeeklyCalc!.toStringAsFixed(0).toString();
      });
    }, onError: (error) {
      setState(() {
        tuesday = 0;
      });
    });

    ChartHydrationModel().getWednesday().listen((value) {
      setState(() {
        wednesday = value;
        hydrationGoalWeeklyCalc = (((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                waterToIngestWeekly!) *
            100);
        hydrationGoalWeekly =
            hydrationGoalWeeklyCalc!.toStringAsFixed(0).toString();
      });
    }, onError: (error) {
      setState(() {
        wednesday = 0;
      });
    });

    ChartHydrationModel().getThursday().listen((value) {
      setState(() {
        thursday = value;
        hydrationGoalWeeklyCalc = (((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                waterToIngestWeekly!) *
            100);
        hydrationGoalWeekly =
            hydrationGoalWeeklyCalc!.toStringAsFixed(0).toString();
      });
    }, onError: (error) {
      setState(() {
        thursday = 0;
      });
    });

    ChartHydrationModel().getFriday().listen((value) {
      setState(() {
        friday = value;
        hydrationGoalWeeklyCalc = (((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                waterToIngestWeekly!) *
            100);
        hydrationGoalWeekly =
            hydrationGoalWeeklyCalc!.toStringAsFixed(0).toString();
      });
    }, onError: (error) {
      setState(() {
        friday = 0;
      });
    });

    ChartHydrationModel().getSaturday().listen((value) {
      setState(() {
        saturday = value;
        hydrationGoalWeeklyCalc = (((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                waterToIngestWeekly!) *
            100);
        hydrationGoalWeekly =
            hydrationGoalWeeklyCalc!.toStringAsFixed(0).toString();
      });
    }, onError: (error) {
      setState(() {
        saturday = 0;
      });
    });

    ChartHydrationModel().getSunday().listen((value) {
      setState(() {
        sunday = value;
        hydrationGoalWeeklyCalc = (((monday! +
                    tuesday! +
                    wednesday! +
                    thursday! +
                    friday! +
                    saturday! +
                    sunday!) /
                waterToIngestWeekly!) *
            100);
        hydrationGoalWeekly =
            hydrationGoalWeeklyCalc!.toStringAsFixed(0).toString();
      });
    }, onError: (error) {
      setState(() {
        sunday = 0;
      });
    });
  }

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
    _hydrationGoalDiary();
    _hydrationGoalWeekly();
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
                              sleepGoalDiary != null
                                  ? '$sleepGoalDiary%'
                                  : '0%',
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
                        SizedBox(
                            width: 35,
                            height: 35,
                            child: Image.asset(
                                sleepQualityMood != null
                                    ? 'lib/assets/images/icons/$sleepQualityMood.png'
                                    : 'lib/assets/images/icons/mood_reasonable.png',
                                color: sleepColorMood ?? colorsMoods[1])),
                        Text(
                          'Qualidade de sono',
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          sleepQuality != null
                              ? '$sleepQuality'
                              : 'Você ainda não informou suas horas de sono hoje :(',
                          textAlign: TextAlign.center,
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
                              hydrationGoalDiary != null
                                  ? '$hydrationGoalDiary%'
                                  : '0%',
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
                              hydrationGoalWeekly != null
                                  ? '$hydrationGoalWeekly%'
                                  : '0%',
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
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.asset(
                            hydrationQualityMood != null
                                ? 'lib/assets/images/icons/$hydrationQualityMood.png'
                                : 'lib/assets/images/icons/mood_reasonable.png',
                            color: hydrationColorMood ?? colorsMoods[1],
                          ),
                        ),
                        // Icon(
                        //   Icons.mood_rounded,
                        //   size: 38,
                        //   color: Theme.of(context).colorScheme.secondary,
                        // ),
                        Text(
                          'Nível de Hidratação',
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          hydrationQuality != null
                              ? '$hydrationQuality'
                              : 'Você ainda não nos informou o quanto bebeu de água! :(',
                          textAlign: TextAlign.center,
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
