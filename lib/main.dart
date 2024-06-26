import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:viver/authentication/auth_screen.dart';
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

  // initializeWaterProperties();
  initializeScheduleProperties();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color(0xFFD2E0FB)));
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
  @override
  void initState() {
    NotificationController.startListeningNotificationEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/presentation': (context) => const Presentation(),
          '/mainpage': (context) => const MainPage(),
          '/treatmentnullspage': (context) => const TreatmentNull(),
        },
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            selectionColor: Color(0XFF79AC78),
            cursorColor: Color(0XFF79AC78),
            selectionHandleColor: Color(0XFF79AC78),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            surface: const Color(0xFFD2E0FB),
            primary: const Color(0XFF79AC78),
            secondary: const Color(0XFF79AC78),
            tertiary: const Color(0xFF40A2E3),
            primaryContainer: const Color(0xFFFFFFFF),
            secondaryContainer: const Color(0xFF79AC78),
          ),
        ),
        home: const CheckAuth(),
      ),
    );
  }
}
