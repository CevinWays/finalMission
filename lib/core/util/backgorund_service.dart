import 'dart:isolate';

import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:restaurant2/core/util/get_restaurant_api_helper.dart';
import 'package:restaurant2/features/show/data/mapper/list_restaurant_mapper.dart';
import 'package:restaurant2/features/show/data/models/list_restaurants_model.dart';

import '../../main.dart';
import 'constant_helper.dart';
import 'dio_helper.dart';
import 'notification_helper.dart';

final ReceivePort port = ReceivePort();
 
class BackgroundService {
  static BackgroundService? _service;
  static String _isolateName = 'isolate';
  static SendPort? _uiSendPort;
 
  BackgroundService._createObject();
 
  factory BackgroundService() {
    if (_service == null) {
      _service = BackgroundService._createObject();
    }
    return _service!;
  }
 
  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }
 
  static Future<void> callback() async {
    print('Alarm fired!');
    final NotificationHelper _notificationHelper = NotificationHelper();
    ListRestaurantsModel _listRestaurantsModel = await GetRestaurantApiHelper.getNetworkDataRestaurant();

    var resultMapper = ListRestaurantMapper.toEntity(_listRestaurantsModel);

    await _notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, resultMapper.restaurants!.first);
 
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
 
  Future<void> someTask() async {
    print('Execute some process');
  }
}