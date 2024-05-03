// IMPLEMENTAR VERIFICAÇÃO DE NULO CASO NÃO

import 'dart:isolate';
import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:viver/main.dart';
import 'package:viver/user_controller/user_model.dart';

late String? name;
late String? wakeUpHour;
late int? hourSleepMax;
late double? hourSleepRemainings;
late double? hourDividedPerDay;
late int? seconds;
late double? weight;
late double? waterIdeal;
double? waterDosage;
double waterIngested = 0;

void initializeWaterProperties() async {
  weight = await UserModel().getWeight();
  waterIdeal = (weight! * 0.350) / 10;
  double? dosage = waterIdeal! / 9;
  String roundedString = dosage.toStringAsFixed(3);
  waterDosage = double.tryParse(roundedString);
}

void initializeScheduleProperties() async {
  name = await UserModel().getName();
  wakeUpHour = await UserModel().getWakeUpHour();
  hourSleepMax = await UserModel().getHourIdealSleepMax();
  hourSleepRemainings = 24.0 - hourSleepMax!;
  hourDividedPerDay = hourSleepRemainings! / 9;

  String hourToString = hourDividedPerDay!.toStringAsFixed(3);
  int? hour = int.tryParse(hourToString.substring(0, 1))! * 3600;
  int? minute = int.tryParse(hourToString.substring(2, 4))! * 60;
  seconds = hour + minute;
}

void setWaterIngestedPerDay() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = auth.currentUser;
  CollectionReference userCollection = firestore.collection('User');
  DateTime now = DateTime.now();
  String dayNow = DateFormat('EEEE', 'en_US').format(now);

  if (user != null) {
    await userCollection
        .doc(user.uid)
        .collection('waterIngestedPerDay')
        .doc('days')
        .set({dayNow: waterIngested}, SetOptions(merge: true));
  }
}

class NotificationController {
  static ReceivedAction? initialAction;

  static Future<void> initializeLocalNotifications() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
      return;
    }

    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelKey: 'viver_channel',
            channelName: 'Viver Notificações',
            channelDescription: 'Lembrete de Hidratação',
            importance: NotificationImportance.High,
          )
        ],
        debug: true);
  }

  static ReceivePort? receivePort;
  static Future<void> initializeIsolateReceivePort() async {
    receivePort = ReceivePort('Notification action port in main isolate')
      ..listen(
          (silentData) => onActionReceivedImplementationMethod(silentData));

    IsolateNameServer.registerPortWithName(receivePort!.sendPort, 'hidratar');
  }

  static Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }

  static Future<void> cancelAllSchedules() async {
    await AwesomeNotifications().cancelAllSchedules();
  }

  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.buttonKeyPressed == 'hidratar') {
      // VERIFICARRRRRRRRRRRRRRRRRRRR A INCREMENTAÇÃO
      waterIngested += waterDosage!;
      setWaterIngestedPerDay();

      // print('A ÁGUA INGERIDA FOI::::::::$waterIngested');
    }

    if (receivedAction.buttonKeyPressed == 'Desativar') {
      cancelAllSchedules();
    }
  }

  static Future<void> onActionReceivedImplementationMethod(
      ReceivedAction receivedAction) async {
    Main.navigatorKey.currentState?.pushNamedAndRemoveUntil('/mainpage',
        (route) => (route.settings.name != '/mainpage') || route.isFirst,
        arguments: receivedAction);
  }

  static Future<void> scheduleNewNotification() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
      return;
    }

    await myNotifyScheduleInHours();
  }
}

Future<void> myNotifyScheduleInHours() async {
  await AwesomeNotifications().createNotification(
    schedule: NotificationInterval(
      interval: 60,
      repeats: true,
      allowWhileIdle: true,
    ),
    content: NotificationContent(
      id: 1,
      channelKey: 'viver_channel',
      title: 'É hora de se hidratar!',
      body: 'Olá, $name! Beba $waterDosage de água.',
      summary: 'Lembrete',
      wakeUpScreen: true,
      backgroundColor: const Color(0XFF79AC78),
      category: NotificationCategory.Alarm,
      actionType: ActionType.SilentAction,
      notificationLayout: NotificationLayout.BigPicture,
      color: const Color(0xFF000000),
      locked: true,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'hidratar',
        label: 'Hidratar-se',
      ),
      NotificationActionButton(
        key: 'Adiar',
        label: 'Adiar',
      ),
      NotificationActionButton(
        key: 'Desativar',
        label: 'Desativar',
      ),
    ],
  );
}
