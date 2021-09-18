part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class GetFavouriteEvent extends FavouriteEvent {}

class AddFavouriteEvent extends FavouriteEvent {
  final Restaurants restaurants;

  AddFavouriteEvent({required this.restaurants});
}

class DeleteFavouriteEvent extends FavouriteEvent {
  final Restaurants restaurants;

  DeleteFavouriteEvent({required this.restaurants});
}
