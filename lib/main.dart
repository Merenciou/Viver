import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:viver/authentication/auth_screen.dart';
import 'package:viver/controllers/dark_theme_controller.dart';
import 'package:viver/custom_widgets/treatment_null.dart';
import 'package:viver/notifications/notifications.dart';
import 'package:viver/screens/mainpage.dart';
import 'package:viver/screens/presentation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:viver/controllers/user_controller.dart';
import 'package:viver/screens/water.dart';
import 'firebase_options.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationController.initializeLocalNotifications();
  await NotificationController.initializeIsolateReceivePort();
  await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
  await NotificationController.startListeningNotificationEvents();

  initializeScheduleProperties();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserController(),
        ),
        ChangeNotifierProvider(
          create: (_) => NullVerifierProvider(),
        ),
      ],
      child: const Main(),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  State<Main> createState() => _Main();
}

class _Main extends State<Main> {
  void _updatedStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: DarkThemeController.instance.isDarkTheme
            ? const Color(0xFF1A2130)
            : const Color(0xFFD2E0FB)));
  }

  @override
  void initState() {
    NotificationController.startListeningNotificationEvents();
    DarkThemeController.instance.addListener(_updatedStatusBarColor);
    super.initState();
  }

  @override
  void dispose() {
    DarkThemeController.instance.removeListener(_updatedStatusBarColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
          animation: DarkThemeController.instance,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/presentation': (context) => const Presentation(),
                '/mainpage': (context) => const MainPage(),
                '/treatmentnullspage': (context) => const TreatmentNull(),
              },
              theme: ThemeData(
                textTheme: TextTheme(
                  titleSmall: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: DarkThemeController.instance.isDarkTheme
                          ? Colors.white70
                          : Colors.black87),
                  titleMedium: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: DarkThemeController.instance.isDarkTheme
                          ? Colors.white70
                          : Colors.black87),
                  titleLarge: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: DarkThemeController.instance.isDarkTheme
                          ? Colors.white70
                          : Colors.black87),
                  bodySmall: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: DarkThemeController.instance.isDarkTheme
                          ? Colors.white70
                          : Colors.black45,
                      fontWeight: FontWeight.w500),
                  bodyMedium: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: DarkThemeController.instance.isDarkTheme
                          ? Colors.white70
                          : Colors.black87,
                      fontWeight: FontWeight.w500),
                  bodyLarge: GoogleFonts.montserrat(
                    fontSize: 24,
                    color: DarkThemeController.instance.isDarkTheme
                        ? Colors.white70
                        : Colors.black87,
                  ),
                  headlineSmall: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: DarkThemeController.instance.isDarkTheme
                        ? Colors.white70
                        : Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                  headlineMedium: GoogleFonts.montserrat(
                      fontSize: 24,
                      color: DarkThemeController.instance.isDarkTheme
                          ? Colors.white70
                          : Colors.black54,
                      fontWeight: FontWeight.w500),
                  headlineLarge: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500),
                  labelSmall: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: DarkThemeController.instance.isDarkTheme
                          ? Colors.white70
                          : Colors.black38,
                      fontWeight: FontWeight.w500),
                  labelMedium: GoogleFonts.montserrat(
                      fontSize: 30,
                      color: DarkThemeController.instance.isDarkTheme
                          ? Colors.white70
                          : Colors.black54,
                      fontWeight: FontWeight.w700),
                  labelLarge: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: DarkThemeController.instance.isDarkTheme
                          ? Colors.white70
                          : Colors.black54,
                      fontWeight: FontWeight.w700),
                  displaySmall: GoogleFonts.montserrat(
                    fontSize: 30,
                    color: DarkThemeController.instance.isDarkTheme
                        ? Colors.white70
                        : Colors.black87,
                  ),
                  displayMedium: GoogleFonts.montserrat(
                      fontSize: 30,
                      color: DarkThemeController.instance.isDarkTheme
                          ? Colors.white70
                          : Colors.black87,
                      fontWeight: FontWeight.w500),
                  displayLarge: GoogleFonts.montserrat(
                    fontSize: 30,
                    color: Colors.white70,
                  ),
                ),
                buttonTheme: ButtonThemeData(
                  colorScheme: ColorScheme(
                    brightness: Brightness.light,
                    primary: DarkThemeController.instance.isDarkTheme
                        ? const Color(0xFF2F58CD)
                        : const Color(0xFF40A2E3),
                    onPrimary: const Color(0xFFA2D5F2),
                    secondary: DarkThemeController.instance.isDarkTheme
                        ? const Color(0XFF5C8374)
                        : const Color(0XFF79AC78),
                    onSecondary: const Color(0xFFF38BA0),
                    error: Colors.red,
                    onError: Colors.red,
                    surface: Colors.grey,
                    onSurface: Colors.green,
                  ),
                ),
                colorScheme: ColorScheme(
                  brightness: Brightness.light,
                  primary: const Color(0XFF79AC78),
                  onPrimary: const Color(0xFF31363F),
                  secondary: DarkThemeController.instance.isDarkTheme
                      ? const Color(0XFF5C8374)
                      : const Color(0XFF79AC78),
                  onSecondary: DarkThemeController.instance.isDarkTheme
                      ? const Color(0xFF686D76)
                      : const Color(0xB3FFFFFF),
                  tertiary: const Color(0xFFF6B17A),
                  error: Colors.red,
                  onError: Colors.redAccent,
                  surface: DarkThemeController.instance.isDarkTheme
                      ? const Color(0xFF1A2130)
                      : const Color(0xFFD2E0FB),
                  onSurface: const Color(0xFFFFFFFF),
                  primaryContainer: DarkThemeController.instance.isDarkTheme
                      ? const Color(0x3DFFFFFF)
                      : const Color(0xB3FFFFFF),
                  secondaryContainer: DarkThemeController.instance.isDarkTheme
                      ? const Color(0x3DFFFFFF)
                      : const Color(0x62FFFFFF),
                ),
              ),
              home: const CheckAuth(),
            );
          }),
    );
  }
}
