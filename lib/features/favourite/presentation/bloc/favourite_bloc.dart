import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../show/domain/entities/restaurants.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial());

  final List<Restaurants> lisRestaurant = [];

  @override
  Stream<FavouriteState> mapEventToState(FavouriteEvent event) async* {
    if (event is GetFavouriteEvent) yield* _getFavourites();
    if (event is AddFavouriteEvent) yield* _addFavourites(event.restaurants);
    if (event is DeleteFavouriteEvent)
      yield* _deleteFavourites(event.restaurants);
  }

  Stream<FavouriteState> _getFavourites() async* {
    try {
      yield FavouriteInitial();
      yield GetFavouriteState(listRestaurant: lisRestaurant);
    } catch (e) {
      yield FavouriteErrorState();
    }
  }

  Stream<FavouriteState> _addFavourites(Restaurants restaurants) async* {
    try {
      yield FavouriteInitial();
      lisRestaurant.add(restaurants);
      yield AddFavouriteState();
    } catch (e) {
      yield FavouriteErrorState();
    }
  }

  Stream<FavouriteState> _deleteFavourites(Restaurants restaurants) async* {
    try {
      yield FavouriteInitial();
      lisRestaurant.removeWhere((element) => restaurants.id == element.id);
      yield DeleteFavouriteState();
    } catch (e) {
      yield FavouriteErrorState();
    }
  }
}
