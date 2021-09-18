import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'backgorund_service.dart';
import 'date_time_helper.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;
 
  bool get isScheduled => _isScheduled;
 
  Future<bool> scheduledNews(bool value) async {
    _isScheduled = value;
    if (_isScheduled) {
      print('Notification Activated');
      Get.snackbar('Restaurant', 'Notification Activated',snackPosition: SnackPosition.BOTTOM);
      notifyListeners();
      // return await AndroidAlarmManager.oneShot(Duration(seconds: 5), 1, BackgroundService.callback);
      return await AndroidAlarmManager.periodic(
        Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('Notification Canceled');
      Get.snackbar('Restaurant', 'Notification Deactivated',snackPosition: SnackPosition.BOTTOM);
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}