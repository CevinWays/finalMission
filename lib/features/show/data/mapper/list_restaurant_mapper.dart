import 'package:restaurant2/features/show/data/mapper/restaurant_mapper.dart';
import 'package:restaurant2/features/show/data/models/list_restaurants_model.dart';
import 'package:restaurant2/features/show/data/models/restaurants_model.dart';
import 'package:restaurant2/features/show/domain/entities/list_restaurants.dart';
import 'package:restaurant2/features/show/domain/entities/restaurants.dart';

class ListRestaurantMapper {
  static ListRestaurants toEntity(ListRestaurantsModel model) =>
      ListRestaurants(
          restaurants: List<Restaurants>.from(
              model.restaurants!.map((e) => RestaurantMapper.toEntity(e))));
}
