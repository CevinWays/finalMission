part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();
  
  @override
  List<Object> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteErrorState extends FavouriteState {}

class GetFavouriteState extends FavouriteState {
  final List<Restaurants> listRestaurant;

  GetFavouriteState({required this.listRestaurant});
}

class AddFavouriteState extends FavouriteState {}

class DeleteFavouriteState extends FavouriteState {
  
}
