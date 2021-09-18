import 'package:restaurant2/features/show/domain/entities/restaurants.dart';

class Search {
  bool? error;
  int? founded;
  List<Restaurants>? restaurants;

  Search({
    this.error,
    this.founded,
    this.restaurants
  });
}