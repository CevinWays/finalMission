
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:restaurant2/features/show/presentation/pages/home_page.dart';

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RestaurantApp2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Restaurant 2'),
    );
  }
}