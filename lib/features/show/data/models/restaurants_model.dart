import 'package:restaurant2/features/show/domain/entities/restaurants.dart';

/// id : "rqdv5juczeskfw1e867"
/// name : "Melting Pot"
/// description : "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ..."
/// pictureId : "14"
/// city : "Medan"
/// rating : 4.2
class RestaurantsModel extends Restaurants{
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;

  RestaurantsModel({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating});

  RestaurantsModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = double.parse(json['rating'].toString());
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['pictureId'] = pictureId;
    map['city'] = city;
    map['rating'] = rating;
    return map;
  }

}