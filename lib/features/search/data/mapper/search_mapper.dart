import 'package:restaurant2/features/search/data/models/search_model.dart';
import 'package:restaurant2/features/search/domain/entities/search.dart';
import 'package:restaurant2/features/show/data/mapper/restaurant_mapper.dart';
import 'package:restaurant2/features/show/domain/entities/restaurants.dart';

class SearchMapper {
  static Search toEntity(SearchModel model) => Search(
    error: model.error,
    founded: model.founded,
    restaurants: List<Restaurants>.from(
              model.restaurants!.map((e) => RestaurantMapper.toEntity(e)))
    );
}