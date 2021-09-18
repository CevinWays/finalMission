import 'package:flutter/services.dart';

class AssetManager {
  static Future<String> fromJson(String path) async =>
      await rootBundle.loadString(path);
}