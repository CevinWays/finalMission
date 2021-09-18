part of 'show_bloc.dart';

@immutable
abstract class ShowState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ShowInitialState extends ShowState {}

class ShowErrorState extends ShowState {}

class GetRestaurantState extends ShowState {
  final ListRestaurants listRestaurants;

  GetRestaurantState({required this.listRestaurants});
}

class LoadingState extends ShowState{}

class NetworkErrorState extends ShowState{}
