import 'package:restaurant2/features/show/data/models/restaurants_model.dart';
import 'package:restaurant2/features/show/domain/entities/restaurants.dart';

class RestaurantMapper {

  static Restaurants toEntity(RestaurantsModel model) => Restaurants(
    id: model.id,
    name: model.name,
    description: model.description,
    city: model.city,
    pictureId: model.pictureId,
    rating: model.rating
  );
  
}