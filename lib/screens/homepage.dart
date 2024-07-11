import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viver/controllers/chart_hydration_model.dart';
import 'package:viver/controllers/chart_sleep_model.dart';
import 'package:viver/controllers/user_model.dart';
import 'package:viver/custom_widgets/chartbar_hydration.dart';
import 'package:viver/custom_widgets/chartbar_sleep.dart';
import 'dart:async';

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
      if (mounted) {
        setState(() {
          salutation = dayShift[2];
        });
      }
    }
    if (time.hour >= 6 && time.hour <= 12) {
      if (mounted) {
        setState(() {
          salutation = dayShift[0];
        });
      }
    }
    if (time.hour >= 13 && time.hour <= 18) {
      if (mounted) {
        setState(() {
          salutation = dayShift[1];
        });
      }
    }
    if (time.hour >= 19 && time.hour <= 23) {
      if (mounted) {
        setState(() {
          salutation = dayShift[2];
        });
      }
    }
  }

  Future<void> restartDatas() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference userCollection = firestore.collection('Users');
    User? user = auth.currentUser;
    DateTime today = DateTime.now();

    if (user != null &&
        today.weekday == 1 &&
        today.hour == 11 &&
        today.minute == 38) {
      final docRefSleep = userCollection
          .doc(user.uid)
          .collection('hourSleptPerDay')
          .doc('days');
      await docRefSleep.delete();

      final docRefHydration = userCollection
          .doc(user.uid)
          .collection('waterIngestedPerDay')
          .doc('days');
      await docRefHydration.delete();
    }
  }

  String? sleepGoalDiary = '0';
  String? sleepGoalWeekly = '0';
  String? hydrationGoalDiary = '0';
  String? hydrationGoalWeekly = '0';
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

  StreamSubscription? _mondaySleepSubscription;
  StreamSubscription? _tuesdaySleepSubscription;
  StreamSubscription? _wednesdaySleepSubscription;
  StreamSubscription? _thursdaySleepSubscription;
  StreamSubscription? _fridaySleepSubscription;
  StreamSubscription? _saturdaySleepSubscription;
  StreamSubscription? _sundaySleepSubscription;

  void _sleepGoalDiary() async {
    double? hoursSlept;
    int? hoursToSleep;
    double? sleepGoalDiaryCalc;
    DateTime today = DateTime.now();

    hoursToSleep = await UserModel().getHourIdealSleepMax() ?? 0;

    _mondaySleepSubscription?.cancel();
    _tuesdaySleepSubscription?.cancel();
    _wednesdaySleepSubscription?.cancel();
    _thursdaySleepSubscription?.cancel();
    _fridaySleepSubscription?.cancel();
    _saturdaySleepSubscription?.cancel();
    _sundaySleepSubscription?.cancel();

    _mondaySleepSubscription = ChartSleepModel().getMonday().listen((value) {
      if (today.day == 1 && hoursToSleep != null && hoursSlept != null) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);
        int? sleepGoalDiaryInt = int.tryParse(sleepGoalDiary!);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[3];
                sleepQualityMood = qualitiesMoods[3];
                sleepColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[2];
                sleepQualityMood = qualitiesMoods[2];
                sleepColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[1];
                sleepQualityMood = qualitiesMoods[1];
                sleepColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[0];
                sleepQualityMood = qualitiesMoods[0];
                sleepColorMood = colorsMoods[0];
              });
            }

            break;
          default:
        }
      }
    }, onError: (error) {
      hoursSlept = 0;
    });

    ChartSleepModel().getTuesday().listen((value) {
      if (today.day == 2 && hoursToSleep != null && hoursSlept != null) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);
        int? sleepGoalDiaryInt = int.tryParse(sleepGoalDiary!);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[3];
                sleepQualityMood = qualitiesMoods[3];
                sleepColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[2];
                sleepQualityMood = qualitiesMoods[2];
                sleepColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[1];
                sleepQualityMood = qualitiesMoods[1];
                sleepColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[0];
                sleepQualityMood = qualitiesMoods[0];
                sleepColorMood = colorsMoods[0];
              });
            }

            break;
          default:
        }
      }
    }, onError: (error) {
      hoursSlept = 0;
    });
    ChartSleepModel().getWednesday().listen((value) {
      if (today.day == 3 && hoursToSleep != null && hoursSlept != null) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);
        int? sleepGoalDiaryInt = int.tryParse(sleepGoalDiary!);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[3];
                sleepQualityMood = qualitiesMoods[3];
                sleepColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[2];
                sleepQualityMood = qualitiesMoods[2];
                sleepColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            setState(() {
              sleepQuality = qualities[1];
              sleepQualityMood = qualitiesMoods[1];
              sleepColorMood = colorsMoods[0];
            });

            break;
          case >= 76 && <= 100:
            if (mounted) {}
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
      if (today.day == 4 && hoursToSleep != null && hoursSlept != null) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / (hoursToSleep)) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);
        int? sleepGoalDiaryInt = int.tryParse(sleepGoalDiary!);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[3];
                sleepQualityMood = qualitiesMoods[3];
                sleepColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[2];
                sleepQualityMood = qualitiesMoods[2];
                sleepColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[1];
                sleepQualityMood = qualitiesMoods[1];
                sleepColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[0];
                sleepQualityMood = qualitiesMoods[0];
                sleepColorMood = colorsMoods[0];
              });
            }

            break;
          default:
        }
      }
    }, onError: (error) {
      hoursSlept = 0;
    });
    ChartSleepModel().getFriday().listen((value) {
      if (today.day == 5 && hoursToSleep != null && hoursSlept != null) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);
        int? sleepGoalDiaryInt = int.tryParse(sleepGoalDiary!);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[3];
                sleepQualityMood = qualitiesMoods[3];
                sleepColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[2];
                sleepQualityMood = qualitiesMoods[2];
                sleepColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[1];
                sleepQualityMood = qualitiesMoods[1];
                sleepColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[0];
                sleepQualityMood = qualitiesMoods[0];
                sleepColorMood = colorsMoods[0];
              });
            }

            break;
          default:
        }
      }
    }, onError: (error) {
      hoursSlept = 0;
    });
    ChartSleepModel().getSaturday().listen((value) {
      if (today.day == 6 && hoursToSleep != null && hoursSlept != null) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);
        int? sleepGoalDiaryInt = int.tryParse(sleepGoalDiary!);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[3];
                sleepQualityMood = qualitiesMoods[3];
                sleepColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[2];
                sleepQualityMood = qualitiesMoods[2];
                sleepColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[1];
                sleepQualityMood = qualitiesMoods[1];
                sleepColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[0];
                sleepQualityMood = qualitiesMoods[0];
                sleepColorMood = colorsMoods[0];
              });
            }

            break;
          default:
        }
      }
    }, onError: (error) {
      hoursSlept = 0;
    });
    ChartSleepModel().getSunday().listen((value) {
      if (today.day == 0 && hoursToSleep != null && hoursSlept != null) {
        hoursSlept = value;
        sleepGoalDiaryCalc = (((hoursSlept ?? 0) / hoursToSleep) * 100);
        sleepGoalDiary = sleepGoalDiaryCalc!.toStringAsFixed(0);
        int? sleepGoalDiaryInt = int.tryParse(sleepGoalDiary!);

        switch (sleepGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[3];
                sleepQualityMood = qualitiesMoods[3];
                sleepColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[2];
                sleepQualityMood = qualitiesMoods[2];
                sleepColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[1];
                sleepQualityMood = qualitiesMoods[1];
                sleepColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                sleepQuality = qualities[0];
                sleepQualityMood = qualitiesMoods[0];
                sleepColorMood = colorsMoods[0];
              });
            }

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
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          monday = 0;
        });
      }
    });
    ChartSleepModel().getTuesday().listen((value) {
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          tuesday = 0;
        });
      }
    });
    ChartSleepModel().getWednesday().listen((value) {
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          wednesday = 0;
        });
      }
    });
    ChartSleepModel().getThursday().listen((value) {
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          thursday = 0;
        });
      }
    });
    ChartSleepModel().getFriday().listen((value) {
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          friday = 0;
        });
      }
    });
    ChartSleepModel().getSaturday().listen((value) {
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          saturday = 0;
        });
      }
    });
    ChartSleepModel().getSunday().listen((value) {
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          sunday = 0;
        });
      }
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
      if (today.day == 1 && waterToIngest != null && waterIngested != null) {
        waterIngested = value;
        hydrationGoalDiaryCalc = (((waterIngested ?? 0) / waterToIngest) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });

    ChartHydrationModel().getTuesday().listen((value) {
      if (today.day == 2 && waterToIngest != null && waterIngested != null) {
        waterIngested = value;
        hydrationGoalDiaryCalc = (((waterIngested ?? 0) / waterToIngest) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });

    ChartHydrationModel().getWednesday().listen((value) {
      if (today.day == 3 && waterToIngest != null && waterIngested != null) {
        waterIngested = value;
        hydrationGoalDiaryCalc = (((waterIngested ?? 0) / waterToIngest) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });

    ChartHydrationModel().getThursday().listen((value) {
      if (today.day == 4 && waterToIngest != null && waterIngested != null) {
        waterIngested = value;
        hydrationGoalDiaryCalc = (((waterIngested ?? 0) / waterToIngest) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });

    ChartHydrationModel().getFriday().listen((value) {
      if (today.day == 5 && waterToIngest != null && waterIngested != null) {
        waterIngested = value;
        hydrationGoalDiaryCalc = (((waterIngested ?? 0) / waterToIngest) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });

    ChartHydrationModel().getSaturday().listen((value) {
      if (today.day == 6 && waterToIngest != null && waterIngested != null) {
        waterIngested = value;
        hydrationGoalDiaryCalc = (((waterIngested ?? 0) / waterToIngest) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
        }
      }
    }, onError: (error) {
      waterIngested = 0;
    });

    ChartHydrationModel().getSunday().listen((value) {
      if (today.day == 0 && waterToIngest != null && waterIngested != null) {
        waterIngested = value;
        hydrationGoalDiaryCalc = (((waterIngested ?? 0) / waterToIngest) * 100);
        hydrationGoalDiary = hydrationGoalDiaryCalc!.toStringAsFixed(0);
        hydrationGoalDiaryInt = int.tryParse(hydrationGoalDiary!);

        switch (hydrationGoalDiaryInt!) {
          case >= 0 && <= 25:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[2];
              });
            }

            break;
          case >= 26 && <= 50:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[1];
              });
            }

            break;
          case >= 51 && <= 75:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

            break;
          case >= 76 && <= 100:
            if (mounted) {
              setState(() {
                hydrationQuality = qualities[3];
                hydrationQualityMood = qualitiesMoods[3];
                hydrationColorMood = colorsMoods[0];
              });
            }

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
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          monday = 0;
        });
      }
    });

    ChartHydrationModel().getTuesday().listen((value) {
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          tuesday = 0;
        });
      }
    });

    ChartHydrationModel().getWednesday().listen((value) {
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          wednesday = 0;
        });
      }
    });

    ChartHydrationModel().getThursday().listen((value) {
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          thursday = 0;
        });
      }
    });

    ChartHydrationModel().getFriday().listen((value) {
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          friday = 0;
        });
      }
    });

    ChartHydrationModel().getSaturday().listen((value) {
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          saturday = 0;
        });
      }
    });

    ChartHydrationModel().getSunday().listen((value) {
      if (mounted) {
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
      }
    }, onError: (error) {
      if (mounted) {
        setState(() {
          sunday = 0;
        });
      }
    });
  }

  var screenReportIndex = 0;

  List<Widget> screenReportList(BuildContext context) {
    return [
      reportSleep(),
      reportHydration(),
    ];
  }

  @override
  void initState() {
    restartDatas();
    shiftSalutation();
    futureName = UserModel().getName();
    _sleepGoalDiary();
    _sleepGoalWeekly();
    _hydrationGoalDiary();
    _hydrationGoalWeekly();
    super.initState();
  }

  @override
  void dispose() {
    _mondaySleepSubscription?.cancel();
    _tuesdaySleepSubscription?.cancel();
    _wednesdaySleepSubscription?.cancel();
    _thursdaySleepSubscription?.cancel();
    _fridaySleepSubscription?.cancel();
    _saturdaySleepSubscription?.cancel();
    _sundaySleepSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;

    return ListView(
      children: [
        SizedBox(
            width: 300,
            height: screenSize.height * 0.85,
            child: screenReportList(context)[screenReportIndex]),
      ],
    );
  }

  Widget reportSleep() {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;

    return Stack(
      children: [
        Positioned(
          right: -6,
          top: 410,
          child: IconButton(
            onPressed: () {
              if (mounted) {
                setState(() {
                  screenReportIndex = 1;
                });
              }
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
                    width: screenSize.height * 0.192,
                    height: screenSize.height * 0.192,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                      // GoogleFonts.montserrat(
                                      //     color:
                                      //      Theme.of(context)
                                      //         .colorScheme
                                      //         .primaryContainer,
                                      //     fontWeight: FontWeight.w500,
                                      //     fontSize: 24),
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
                            return Text(salutation,
                                style:
                                    Theme.of(context).textTheme.headlineMedium
                                // GoogleFonts.montserrat(
                                //     color: Colors.black,
                                //     fontWeight: FontWeight.w500,
                                //     fontSize: 24),
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
                      'Relatório sono (semanal):',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    width: double.infinity,
                    height: screenSize.height * 0.186,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const SleepChartBar(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenSize.width * 0.35,
                      height: screenSize.height * 0.15,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
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
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Text(
                              'Meta de sono\n(diário)',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: screenSize.width * 0.35,
                      height: screenSize.height * 0.15,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
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
                              sleepGoalWeekly != null
                                  ? '0%'
                                  : '$sleepGoalWeekly%',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Text(
                              'Meta de sono\n(semanal)',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.titleSmall,
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
                    height: screenSize.height * 0.14,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
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
                              fontSize: screenSize.width * 0.055,
                              fontWeight: FontWeight.w500),
                        ),
                        sleepQuality != null
                            ? Text(
                                '$sleepQuality',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: screenSize.width * 0.04,
                                ),
                              )
                            : Text(
                                'Você não informou suas horas de sono hoje',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: screenSize.width * 0.028,
                                ),
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
                            if (mounted) {
                              setState(() {
                                screenReportIndex = 0;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 15,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (mounted) {
                              setState(() {
                                screenReportIndex = 1;
                              });
                            }
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

  Widget reportHydration() {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;

    return Stack(
      children: [
        Positioned(
          left: -6,
          top: 410,
          child: IconButton(
            onPressed: () {
              if (mounted) {
                setState(() {
                  screenReportIndex = 0;
                });
              }
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
                    width: screenSize.height * 0.190,
                    height: screenSize.height * 0.190,
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
                          // ALTERAR O BOM DIA
                          // ALTERAR O BOM DIA
                          // ALTERAR O BOM DIA
                          // ALTERAR O BOM DIA
                          // ALTERAR O BOM DIA
                          // ALTERAR O BOM DIA
                          // ALTERAR O BOM DIA
                          // ALTERAR O BOM DIA

                          TextSpan(
                            text: 'Bom dia, ',
                            style: Theme.of(context).textTheme.headlineMedium,
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
                      'Relatório hidratação (semanal):',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    width: double.infinity,
                    height: screenSize.height * 0.186,
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
                      width: screenSize.width * 0.35,
                      height: screenSize.height * 0.15,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
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
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Text(
                              'Meta hidratação\n(diária)',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: screenSize.width * 0.35,
                      height: screenSize.height * 0.15,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
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
                                  ? '0%'
                                  : '$hydrationGoalWeekly%',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Text(
                              'Meta hidratação\n(semanal)',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.titleSmall,
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
                    height: screenSize.height * 0.14,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
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
                        Text(
                          'Nível de Hidratação',
                          style: GoogleFonts.montserrat(
                              fontSize: screenSize.width * 0.055,
                              fontWeight: FontWeight.w500),
                        ),
                        hydrationQuality != null
                            ? Text(
                                '$sleepQuality',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: screenSize.width * 0.04,
                                ),
                              )
                            : Text(
                                'Você não informou o quanto bebeu hoje',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: screenSize.width * 0.028,
                                ),
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
                            if (mounted) {
                              setState(() {
                                screenReportIndex = 0;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (mounted) {
                              setState(() {
                                screenReportIndex = 1;
                              });
                            }
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
