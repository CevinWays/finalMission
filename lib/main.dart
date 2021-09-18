import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant2/core/util/constant_helper.dart';
import 'package:restaurant2/core/util/dio_helper.dart';
import 'package:restaurant2/main_app.dart';

import 'core/util/backgorund_service.dart';
import 'core/util/notification_helper.dart';
import 'injection_container.dart' as di;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
   FlutterLocalNotificationsPlugin();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  /// Init DI
  await di.init();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
   await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  /// Prepare Dio
  DioHelper.initDio(ConstantHelper.BASE_URL);
  DioHelper.setDioInterceptor(ConstantHelper.BASE_URL);
  
  runApp(MainApp());
}
