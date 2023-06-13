import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> scheduleNotification(DateTime dateTime) async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id', // A unique ID for the channel.
    'Channel Name', // The channel name.

    importance: Importance.max,
    priority: Priority.high,
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.schedule(
    0, // A unique ID for the notification.
    'Reminder', // The notification title.
    'Remember to do something!', // The notification body.
    dateTime, // The date and time to show the notification.
    platformChannelSpecifics,
    // ignore: deprecated_member_use
    androidAllowWhileIdle: true,
  );
}
