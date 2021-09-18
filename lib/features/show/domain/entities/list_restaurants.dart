import 'package:restaurant2/features/show/domain/entities/restaurants.dart';

/// restaurants : [{"id":"rqdv5juczeskfw1e867","name":"Melting Pot","description":"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...","pictureId":"14","city":"Medan","rating":4.2},{"id":"s1knt6za9kkfw1e867","name":"Kafe Kita","description":"Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...","pictureId":"25","city":"Gorontalo","rating":4}]

class ListRestaurants {
  List<Restaurants>? restaurants;

  ListRestaurants({this.restaurants});
}