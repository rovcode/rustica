import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notificacion {
  final String titulo;
  final String mensaje;
  Notificacion({ required this.titulo, required this.mensaje});
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  getstate(){
      init();
      showNotification();
  }
  init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    /*this.flutterLocalNotificationsPlugin.initialize(initializationSettings);*/
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, titulo,mensaje,        
        platformChannelSpecifics,
        payload: 'item x');
  }
}
