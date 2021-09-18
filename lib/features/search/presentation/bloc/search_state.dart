part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState {}

class GetSearchState extends SearchState {
  final List<Restaurants>? listRestaurants;

  GetSearchState({required this.listRestaurants});
}

class SearchErrorState extends SearchState{}

class LoadingState extends SearchState{}

class NetworkErrorState extends SearchState{}
