import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("defaultIcon");

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: _onDidReceiveLocalNotification);
    final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: initializationSettingsDarwin);

    await _localNotificationService.initialize(
      settings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName",
            channelDescription: "description",
            importance: Importance.max,
            priority: Priority.max,
            playSound: true);

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    return const NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }

  Future<void> showNotifications(
      {required int id, required String title, required String body}) async {
    final deatils = await _notificationDetails();
    await _localNotificationService.show(id, title, body, deatils);
  }

  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print("Here is a Id $id");
  }

  void _onDidReceiveNotificationResponse(NotificationResponse details) {
    print("$details");
  }
}
