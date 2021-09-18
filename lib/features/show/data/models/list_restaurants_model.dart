import 'package:restaurant2/features/show/data/models/restaurants_model.dart';

/// restaurants : [{"id":"rqdv5juczeskfw1e867","name":"Melting Pot","description":"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...","pictureId":"14","city":"Medan","rating":4.2},{"id":"s1knt6za9kkfw1e867","name":"Kafe Kita","description":"Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...","pictureId":"25","city":"Gorontalo","rating":4}]

class ListRestaurantsModel {
  List<RestaurantsModel>? restaurants;

  ListRestaurantsModel({this.restaurants});

  ListRestaurantsModel.fromJson(dynamic json) {
    if (json['restaurants'] != null) {
      restaurants = [];
      json['restaurants'].forEach((v) {
        restaurants?.add(RestaurantsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (restaurants != null) {
      map['restaurants'] = restaurants?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}