import 'dart:isolate';
import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:viver/main.dart';
import 'package:viver/controllers/user_model.dart';

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
  UserModel userModel = UserModel();
  weight = await userModel.getWeight();
  if (weight != null) {
    waterIdeal = ((weight ?? 0) * 0.350) / 10;

    double? dosage = waterIdeal! / 9;
    String roundedString = dosage.toStringAsFixed(3);
    waterDosage = double.tryParse(roundedString);
  }
}

void initializeScheduleProperties() async {
  name = await UserModel().getName();
  wakeUpHour = await UserModel().getWakeUpHour();
  hourSleepMax = await UserModel().getHourIdealSleepMax() ?? 0;
  hourSleepRemainings = 24.0 - hourSleepMax!;
  hourDividedPerDay = hourSleepRemainings! / 9;

  // String hourToString = hourDividedPerDay!.toStringAsFixed(3);
  // int? hour = int.tryParse(hourToString.substring(0, 1))! * 3600;
  // int? minute = int.tryParse(hourToString.substring(2, 4))! * 60;
  // seconds = hour + minute;
}

void setWaterIngestedPerDay() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = auth.currentUser;
  CollectionReference userCollection = firestore.collection('Users');
  DateTime now = DateTime.now();
  String dayNow = DateFormat('EEEE', 'en_US').format(now).toLowerCase();

  String waterIngestedFormatation = waterIngested.toStringAsFixed(2);

  if (user != null) {
    await userCollection
        .doc(user.uid)
        .collection('waterIngestedPerDay')
        .doc('days')
        .set({dayNow: waterIngestedFormatation}, SetOptions(merge: true));
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
            channelKey: 'hydration_channel',
            channelName: 'Notificação de Hidratação',
            channelDescription: 'Lembrete diário de Hidratação',
            importance: NotificationImportance.High,
          ),
          NotificationChannel(
            channelKey: 'stretching_channel',
            channelName: 'Notificação de Alongamento',
            channelDescription: 'Lembrete periódico de Alongamentos',
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

    IsolateNameServer.registerPortWithName(
        receivePort!.sendPort, 'confirm_hydration');
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
    if (receivedAction.buttonKeyPressed == 'confirm_hydration') {
      initializeWaterProperties();

      waterIngested += waterDosage!;
      setWaterIngestedPerDay();
      await AwesomeNotifications().dismiss(1);
    }

    if (receivedAction.buttonKeyPressed == 'late_hydration') {
      await AwesomeNotifications().dismiss(1);
    }

    if (receivedAction.buttonKeyPressed == 'disable_hydration') {
      await AwesomeNotifications()
          .cancelNotificationsByChannelKey('hydration_channel');
    }

    if (receivedAction.buttonKeyPressed == 'confirm_stretching' ||
        receivedAction.buttonKeyPressed == 'late_stretching') {
      await AwesomeNotifications().dismiss(2);
    }

    if (receivedAction.buttonKeyPressed == 'disable_stretching') {
      await AwesomeNotifications()
          .cancelNotificationsByChannelKey('stretching_channel');
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

    await notifyHydrationSchedule();
    await notififyStretchingSchedule();
  }
}

Future<void> notifyHydrationSchedule() async {
  int interval = (hourDividedPerDay! * 3600).toInt();

  for (int i = 0; i < 9; i++) {
    await AwesomeNotifications().createNotification(
      schedule: NotificationInterval(
        interval: interval,
        repeats: true,
        allowWhileIdle: true,
        timeZone: 'UTC',
      ),
      content: NotificationContent(
        id: 1,
        channelKey: 'hydration_channel',
        title: 'É hora de se hidratar!',
        body: 'Olá, $name! Beba $waterDosage de água.',
        summary: 'Lembrete',
        wakeUpScreen: true,
        backgroundColor: const Color(0XFF79AC78),
        category: NotificationCategory.Alarm,
        actionType: ActionType.Default,
        notificationLayout: NotificationLayout.BigPicture,
        color: const Color(0xFF000000),
        locked: true,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'confirm_hydration',
          label: 'Hidratar-se',
          actionType: ActionType.KeepOnTop,
        ),
        NotificationActionButton(
            key: 'late_hydration',
            label: 'Adiar',
            actionType: ActionType.DisabledAction),
        NotificationActionButton(
          key: 'disable_hydration',
          label: 'Desativar',
          actionType: ActionType.KeepOnTop,
        ),
      ],
    );
  }
}

Future<void> notififyStretchingSchedule() async {
  AwesomeNotifications().createNotification(
    schedule: NotificationInterval(
      interval: 60,
      repeats: true,
      allowWhileIdle: true,
    ),
    content: NotificationContent(
      id: 2,
      channelKey: 'stretching_channel',
      title: 'Hora de se alongar!',
      body: 'Olá, $name! Alivie a tensão e dê uma esticada :)',
      summary: 'Lembrete',
      wakeUpScreen: true,
      backgroundColor: const Color(0XFF79AC78),
      category: NotificationCategory.Alarm,
      actionType: ActionType.Default,
      notificationLayout: NotificationLayout.BigPicture,
      color: const Color(0xFF000000),
      locked: true,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'confirm_stretching',
        label: 'Alongar',
        actionType: ActionType.DisabledAction,
      ),
      NotificationActionButton(
          key: 'late_stretching',
          label: 'Adiar',
          actionType: ActionType.DisabledAction),
      NotificationActionButton(
          key: 'disable_stretching',
          label: 'Desativar',
          actionType: ActionType.KeepOnTop),
    ],
  );
}
