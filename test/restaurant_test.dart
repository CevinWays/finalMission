import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant2/features/show/data/models/list_restaurants_model.dart';


void main() {
  test('List should not empty', () async {
    /// arrange
    bool isNotEmpty = false;
    final file = new File('assets/jsons/restaurants.json');
    final json = jsonDecode(await file.readAsString());

    /// act
    final responseModel = ListRestaurantsModel.fromJson(json);
    isNotEmpty = responseModel.restaurants?.isNotEmpty ?? false;

    /// assert
    expect(isNotEmpty, true);
  });
}
