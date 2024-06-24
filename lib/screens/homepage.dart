import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
                              '78%',
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
                              '70%',
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
