import 'dart:convert';

import 'package:restaurant2/features/show/data/models/list_restaurants_model.dart';

import 'constant_helper.dart';
import 'package:http/http.dart' as http;

class GetRestaurantApiHelper {
  static Future<ListRestaurantsModel> getNetworkDataRestaurant() async{
    final response = await http.get(Uri.parse(ConstantHelper.BASE_URL + ConstantHelper.GET_RESTAURANT));
    if (response.statusCode == 200) {
      return ListRestaurantsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}