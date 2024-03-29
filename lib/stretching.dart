import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viver/clock.dart';

List<String> intervalStretching = <String>[
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
  bool stateAlarm = false;
  String dropDownValue = intervalStretching.first;

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
                    'Desativado',
                    style: GoogleFonts.montserrat(),
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
                        color: Theme.of(context).colorScheme.primary,
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
                        });
                      }),
                  // secondary: Text(
                  //   '00:40',
                  //   style: GoogleFonts.montserrat(
                  //       fontSize: 30,
                  //       fontWeight: FontWeight.w700,
                  //       color: Colors.black45),
                  // ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  inactiveTrackColor: Theme.of(context).colorScheme.primary,
                  trackOutlineColor:
                      const MaterialStatePropertyAll(Colors.white),
                  value: stateAlarm,
                  onChanged: (details) {
                    setState(() {
                      stateAlarm = !stateAlarm;
                    });
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
