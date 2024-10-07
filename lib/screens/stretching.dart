import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viver/custom_widgets/clock.dart';
import 'package:viver/notifications/notifications.dart';
import 'package:viver/warnings/warnings.dart';

String interval = '00:00';
bool stateAlarm = false;

void setInterval(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('intervalStretching', value);
}

Future<String> getInterval() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? intervalStretching = prefs.getString('intervalStretching') ?? '00:00';

  return intervalStretching;
}

// Alarm

void setStateAlarm() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setBool('stateAlarm', stateAlarm);
}

Future<bool> getStateAlarm() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  bool stateAlarm = prefs.getBool('stateAlarm') ?? false;
  return stateAlarm;
}

List<String> intervalStretching = <String>[
  '00:00',
  '00:10',
  '00:20',
  '00:30',
  '00:40',
  '00:50',
  '01:00',
];

class StretchingPage extends StatefulWidget {
  const StretchingPage({super.key});

  @override
  State<StretchingPage> createState() => _StretchingPageState();
}

class _StretchingPageState extends State<StretchingPage> {
  String dropDownValue = '00:00';

  @override
  void initState() {
    getStateAlarm().then((value) {
      setState(() {
        stateAlarm = value;
      });
    });
    getInterval().then((value) {
      setState(() {
        dropDownValue = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Clock(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Defina um intervalo de tempo para se alongar frequentemente:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Container(
              width: 350,
              height: 90,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: SwitchListTile(
                  title: Text(
                    stateAlarm ? 'Ligado' : 'Desligado',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  secondary: DropdownButton<String>(
                      value: dropDownValue,
                      style: GoogleFonts.montserrat(
                          color: Colors.black45,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                      menuMaxHeight: 200,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black45,
                        size: 30,
                      ),
                      dropdownColor: Colors.white,
                      underline: Container(
                        height: 2,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      elevation: 1,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      items: intervalStretching
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        initializeScheduleProperties();
                        setState(() {
                          dropDownValue = value!;
                          interval = value;
                        });
                        switch (interval) {
                          case '00:10':
                            setState(() {
                              interval = '10';
                            });

                            break;
                          case '00:20':
                            setState(() {
                              interval = '20';
                            });

                            break;
                          case '00:30':
                            setState(() {
                              interval = '30';
                            });

                            break;
                          case '00:40':
                            setState(() {
                              interval = '40';
                            });

                            break;
                          case '00:50':
                            setState(() {
                              interval = '50';
                            });

                            break;
                          case '01:00':
                            setState(() {
                              interval = '60';
                            });

                            break;
                          default:
                        }
                        setInterval(value!);
                      }),
                  inactiveThumbColor: Colors.black38,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  inactiveTrackColor: Theme.of(context).colorScheme.surface,
                  trackOutlineColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                  value: stateAlarm,
                  onChanged: (details) async {
                    setState(() {
                      stateAlarm = !stateAlarm;
                      if (dropDownValue == '00:00') {
                        stateAlarm = false;
                        if (mounted) {
                          Warnings.snackBarIntervalNull(context);
                        }
                      }
                    });

                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    await prefs.setBool('stateAlarm', stateAlarm);

                    if (stateAlarm) {
                      await NotificationController
                          .scheduleStretchingNotification();
                    } else {
                      await AwesomeNotifications()
                          .cancelSchedulesByChannelKey('stretching_channel');
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
