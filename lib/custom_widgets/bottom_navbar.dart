import 'package:flutter/material.dart';
import 'package:viver/screens/breathe.dart';
import 'package:viver/screens/homepage.dart';
import 'package:viver/screens/sleep.dart';
import 'package:viver/screens/stretching.dart';
import 'package:viver/screens/water.dart';

int buttonIndex = 2;

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key, buttonIndex});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final bottomNavImg = [
    'water',
    'breathe',
    'home',
    'sleep',
    'stretching',
  ];

  List<Widget> bottomButtons(BuildContext context) {
    return [
      waterButton(),
      breatheButton(),
      homeButton(),
      sleepButton(),
      stretchingButton(),
    ];
  }

  List<Widget> screensList(BuildContext context) {
    return [
      const WaterPage(),
      const BreathePage(),
      const HomePage(),
      const Sleep(),
      const StretchingPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomButtons(context)[buttonIndex],
      body: screensList(context)[buttonIndex],
    );
  }

  Widget waterButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: SizedBox(
        width: 300,
        height: 100,
        child: BottomAppBar(
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          color: Theme.of(context).colorScheme.surface,
          child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 0.1,
                      blurRadius: 20,
                      offset: const Offset(0, 3))
                ],
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 0;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/water.png',
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 1;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/breathe.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 2;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/home.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 3;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/sleep.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 4;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/stretching.png',
                          color: Colors.black,
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget breatheButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: SizedBox(
        width: 300,
        height: 100,
        child: BottomAppBar(
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          color: Theme.of(context).colorScheme.surface,
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 0;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/water.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 1;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/breathe.png',
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 2;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/home.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 3;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/sleep.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 4;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/stretching.png',
                          color: Colors.black,
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget homeButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: SizedBox(
        width: 300,
        height: 100,
        child: BottomAppBar(
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          color: Theme.of(context).colorScheme.surface,
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 0;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/water.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 1;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/breathe.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 2;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/home.png',
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 3;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/sleep.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 4;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/stretching.png',
                          color: Colors.black,
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget sleepButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: SizedBox(
        width: 300,
        height: 100,
        child: BottomAppBar(
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          color: Theme.of(context).colorScheme.surface,
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 0;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/water.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 1;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/breathe.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 2;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/home.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 3;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/sleep.png',
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 4;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/stretching.png',
                          color: Colors.black,
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget stretchingButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: SizedBox(
        width: 300,
        height: 100,
        child: BottomAppBar(
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          color: Theme.of(context).colorScheme.surface,
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 0;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/water.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 1;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/breathe.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 2;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/home.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 3;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/sleep.png',
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            buttonIndex = 4;
                          });
                        },
                        icon: Image.asset(
                          'lib/assets/images/icons/stretching.png',
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
