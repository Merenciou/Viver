import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viver/authentication/auth_service.dart';
import 'package:viver/controllers/dark_theme_controller.dart';
import 'package:viver/custom_widgets/bottom_navbar.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:viver/controllers/user_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viver/screens/presentation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  double directX = 0.0;
  late Future<String?> name;
  bool? isFirstTime = true;
  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();

  Future<void> getFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? userId = user!.email;
    if (userId != null) {
      setState(() {
        isFirstTime = prefs.getBool('isFirstTime$userId') ?? true;
      });
    }
  }

  @override
  void initState() {
    name = UserModel().getName();
    DarkThemeController.instance.loadTheme();
    getFirstTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isFirstTime!
        ? const Presentation()
        : SideMenu(
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
                        child:
                            SvgPicture.asset('lib/assets/images/welcome.svg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: FutureBuilder(
                          future: name,
                          builder: (BuildContext context,
                              AsyncSnapshot asyncSnapshot) {
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
                        onPressed: () {
                          Navigator.of(context).pushNamed('/privacypage');
                        },
                        child: Text(
                          'Privacidade',
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/deleteuserpage');
                        },
                        child: Text(
                          'Excluir Conta',
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          AuthService().signOutUser();
                          Navigator.of(context).pushNamed('/signpage');
                        },
                        child: Text(
                          'Trocar de Usuário',
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Switch(
                        value: DarkThemeController.instance.isDarkTheme,
                        trackOutlineColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        inactiveTrackColor:
                            Theme.of(context).colorScheme.surface,
                        activeTrackColor:
                            Theme.of(context).colorScheme.onPrimary,
                        activeColor: Colors.red,
                        thumbIcon: WidgetStateProperty.all(Icon(
                          DarkThemeController.instance.isDarkTheme
                              ? Icons.nightlight_round_outlined
                              : Icons.sunny,
                          color: DarkThemeController.instance.isDarkTheme
                              ? Colors.white
                              : Colors.yellow,
                        )),
                        thumbColor: WidgetStateProperty.all(
                            Theme.of(context).colorScheme.primary),
                        onChanged: (value) {
                          DarkThemeController.instance.changeTheme();
                        },
                      ),
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
              child: const Scaffold(
                resizeToAvoidBottomInset: false,
                body: CustomNavigationBar(),
              ),
            ),
          );
  }
}
