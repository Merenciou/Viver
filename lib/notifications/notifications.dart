import 'dart:isolate';
import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:viver/main.dart';
import 'package:viver/user_controller/user_controller.dart';
import 'package:viver/user_controller/user_model.dart';

String? wakeUpHour = UserController().wakeUpHour;
double? weight;
double? waterIdeal;
double? waterIngested;
double? waterDosage;

Future<double?> getWaterProperties() async {
  UserModel userModel = UserModel();
  await userModel.getWeight();
  weight = userModel.weight;
  waterIdeal = (weight ?? 0 * 0.350) / 10;
  double dosage = waterIdeal! / 9;
  String roundedString = dosage.toStringAsFixed(3);
  waterDosage = double.tryParse(roundedString);

  return weight;
}

Future<String?> getSleepHourIdeal() async {
  UserModel userModel = UserModel();
  await userModel.getWakeUpHour();

  wakeUpHour = userModel.wakeUpHour;

  return wakeUpHour;
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
            channelKey: 'water_channel',
            channelName: 'Viver Notificações',
            channelDescription: 'Lembrete de Hidratação',
            importance: NotificationImportance.High,
          )
        ],
        debug: true);

    // initialAction = await AwesomeNotifications()
    //     .getInitialNotificationAction(removeFromActionEvents: false);
  }

  static ReceivePort? receivePort;
  static Future<void> initializeIsolateReceivePort() async {
    receivePort = ReceivePort('Porta de ação de notificação no isolado')
      ..listen(
          (silentData) => onActionReceivedImplementationMethod(silentData));

    IsolateNameServer.registerPortWithName(receivePort!.sendPort, 'Hidratar');
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
    if (receivedAction.buttonKeyPressed == 'Hidratar') {
      waterIngested = waterIngested! + waterDosage!;
      print('QUANTIDADE DE ÁGUA INGERIDA: $waterIngested');
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

  // static Future<void> executeLongTaskInBackground() async {
  //   print('Iniciando Long Task');
  //   await Future.delayed(const Duration(seconds: 4));
  //   final url = Uri.parse('http://google.com');
  //   final re = await http.get(url);
  // }

  // static Future<void> createNotification() async {
  //   await AwesomeNotifications().createNotification(
  //     content: NotificationContent(
  //       id: 1,
  //       channelKey: 'water_channel',
  //       title: 'É hora de se hidratar!',
  //       body: 'Olá, Vitor! Beba 350ml de água.',
  //       summary: 'Lembrete',
  //       wakeUpScreen: true,
  //       backgroundColor: const Color(0XFF79AC78),
  //       locked: true,
  //     ),
  //     actionButtons: [
  //       NotificationActionButton(
  //         key: 'Hidratar',
  //         label: 'Hidratar-se',
  //         actionType: ActionType.SilentAction,
  //       ),
  //       NotificationActionButton(
  //         key: 'Adiar',
  //         label: 'Adiar',
  //         actionType: ActionType.SilentAction,
  //       ),
  //       NotificationActionButton(
  //         key: 'Desativar',
  //         label: 'Desativar',
  //         actionType: ActionType.SilentBackgroundAction,
  //       ),
  //     ],
  //   );
  // }

  static Future<void> scheduleNewNotification() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
      return;
    }

    await myNotifyScheduleInHours();
  }

  // static Future<void> resetBadgeCounter() async {
  //   await AwesomeNotifications().resetGlobalBadge();
  // }
}

Future<void> myNotifyScheduleInHours() async {
  UserModel userModel = UserModel();
  await userModel.getName();

  await userModel.getWakeUpHour();
  int hour = int.parse(userModel.wakeUpHour!.substring(0, 2));
  int minute = int.parse(userModel.wakeUpHour!.substring(3, 5));

  await AwesomeNotifications().createNotification(
    schedule: NotificationCalendar(
      hour: hour,
      minute: minute,
      repeats: true,
      allowWhileIdle: true,
    ),
    content: NotificationContent(
      id: 1,
      channelKey: 'water_channel',
      title: 'É hora de se hidratar!',
      body: 'Olá, ${userModel.name}! Beba $waterDosage de água.',
      summary: 'Lembrete',
      wakeUpScreen: true,
      backgroundColor: const Color(0XFF79AC78),
      category: NotificationCategory.Alarm,
      actionType: ActionType.SilentAction,

      notificationLayout: NotificationLayout.BigPicture,
      //actionType : ActionType.DismissAction,
      color: const Color(0xFF000000),
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'Hidratar',
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
