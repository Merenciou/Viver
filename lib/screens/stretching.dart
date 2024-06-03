import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viver/custom_widgets/clock.dart';
import 'package:viver/notifications/notifications.dart';

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

  void _snackBarIntervalNull() {
    var snackBarEmailWrong = const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.red,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Selecione um intervalo primeiro',
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarEmailWrong);
  }

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
                style: GoogleFonts.montserrat(color: Colors.black38),
              ),
            ),
            Container(
              width: 350,
              height: 90,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: SwitchListTile(
                  title: Text(
                    stateAlarm ? 'Ligado' : 'Desligado',
                    style: GoogleFonts.montserrat(color: Colors.black38),
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
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  inactiveTrackColor: Theme.of(context).colorScheme.surface,
                  trackOutlineColor: const WidgetStatePropertyAll(Colors.white),
                  value: stateAlarm,
                  onChanged: (details) async {
                    setState(() {
                      stateAlarm = !stateAlarm;
                      if (dropDownValue == '00:00') {
                        stateAlarm = false;
                        _snackBarIntervalNull();
                      }
                    });

                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    await prefs.setBool('stateAlarm', stateAlarm);

                    if (stateAlarm) {
                      await notififyStretchingSchedule();
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
