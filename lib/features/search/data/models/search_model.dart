import 'package:restaurant2/features/show/data/models/restaurants_model.dart';

class SearchModel {
  bool? error;
  int? founded;
  List<RestaurantsModel>? restaurants;

  SearchModel({
    this.error,
    this.founded,
    this.restaurants
    });

  SearchModel.fromJson(dynamic json){
    error = json['error'];
    founded = json['founded'];
    if (json['restaurants'] != null) {
      restaurants = [];
      json['restaurants'].forEach((v) {
        restaurants?.add(RestaurantsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
        "error": error,
        "founded": founded,
        "restaurants": List<dynamic>.from(restaurants!.map((x) => x.toJson())),
    };
}