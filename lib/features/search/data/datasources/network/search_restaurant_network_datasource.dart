import 'package:restaurant2/features/search/data/models/search_model.dart';

abstract class SearchRestaurantNetworkDatasource {
  Future<SearchModel> getNetworkDataSearchRestaurant(String query);
}