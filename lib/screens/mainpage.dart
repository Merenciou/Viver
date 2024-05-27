import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viver/authentication/auth_service.dart';
import 'package:viver/screens/breathe.dart';
import 'package:viver/screens/homepage.dart';
import 'package:viver/screens/sleep.dart';
import 'package:viver/screens/stretching.dart';
import 'package:viver/screens/water.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:viver/controllers/user_model.dart';
import 'package:google_fonts/google_fonts.dart';

int buttonIndex = 2;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  double directX = 0.0;
  late Future<String?> name;
  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
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
  void initState() {
    name = UserModel().getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: sideMenuKey,
      type: SideMenuType.slide,
      background: Theme.of(context).colorScheme.secondary,
      menu: SizedBox(
        height: 810,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 90,
                  child: SvgPicture.asset('lib/assets/images/welcome.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder(
                    future: name,
                    builder:
                        (BuildContext context, AsyncSnapshot asyncSnapshot) {
                      if (asyncSnapshot.connectionState ==
                          ConnectionState.done) {
                        if (asyncSnapshot.hasData) {
                          return Text(
                            'Olá, ${asyncSnapshot.data!}',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          );
                        } else {
                          return const Text('Usuário');
                        }
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                Container(
                  width: 70,
                  height: 3,
                  color: Colors.amber,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sobre',
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Avalie-nos',
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Privacidade',
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Excluir Conta',
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    AuthService().signOutUser();
                  },
                  child: Text(
                    'Trocar de Usuário',
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
            Text(
              'Desenvolvido por Vitor Merencio :)',
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 12),
            ),
          ],
        ),
      ),
      child: GestureDetector(
        onPanUpdate: (detail) {
          setState(() {
            directX += detail.delta.dx;
          });
        },
        onPanEnd: (detail) {
          final state = sideMenuKey.currentState;

          if (state!.isOpened) {
            if (directX < 100) {
              state.closeSideMenu();
            }
          } else {
            if (directX > 100) {
              state.openSideMenu();
            }
          }

          setState(() {
            directX = 0.0;
          });
        },
        child: Scaffold(
          bottomNavigationBar: bottomButtons(context)[buttonIndex],
          backgroundColor: Theme.of(context).colorScheme.background,
          body: screensList(context)[buttonIndex],
        ),
      ),
    );
  }

  Widget waterButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: SizedBox(
        width: 300,
        height: 100,
        child: BottomAppBar(
          surfaceTintColor: Theme.of(context).colorScheme.background,
          color: Theme.of(context).colorScheme.background,
          child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 0.1,
                      blurRadius: 20,
                      offset: const Offset(0, 3))
                ],
                color: Colors.white,
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
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
          surfaceTintColor: Theme.of(context).colorScheme.background,
          color: Theme.of(context).colorScheme.background,
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
          surfaceTintColor: Theme.of(context).colorScheme.background,
          color: Theme.of(context).colorScheme.background,
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
          surfaceTintColor: Theme.of(context).colorScheme.background,
          color: Theme.of(context).colorScheme.background,
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
          surfaceTintColor: Theme.of(context).colorScheme.background,
          color: Theme.of(context).colorScheme.background,
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                          color: Colors.white,
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
