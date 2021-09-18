part of 'show_bloc.dart';

@immutable
abstract class ShowEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class GetRestaurantEvent extends ShowEvent{}
