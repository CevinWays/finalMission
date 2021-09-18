import 'package:restaurant2/features/show/data/models/list_restaurants_model.dart';

abstract class RestaurantNetworkDataSource {
  Future<ListRestaurantsModel> getNetworkDataRestaurant();
}