import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant2/core/error/failures.dart';
import 'package:restaurant2/core/util/check_connection_helper.dart';
import 'package:restaurant2/features/show/domain/entities/list_restaurants.dart';
import 'package:restaurant2/features/show/domain/usecases/get_restaurant.dart';

part 'show_event.dart';
part 'show_state.dart';

class ShowBloc extends Bloc<ShowEvent, ShowState> {
  final GetRestaurant getRestaurant;

  ShowBloc({required this.getRestaurant}) : super(ShowInitialState());

  @override
  Stream<ShowState> mapEventToState(ShowEvent event) async* {
    if(event is GetRestaurantEvent)
      yield* _getRestaurant();
  }

  Stream<ShowState> _getRestaurant() async*{
    yield ShowInitialState();
    yield LoadingState();

    bool isConnect = false;
    isConnect = await CheckConnectionHelper.funCheckConnection();
    var result;

    if(isConnect){
      result = await getRestaurant.getRestaurant();
      yield* resultGetData(result);
    }else{
      yield NetworkErrorState();
    }
  }

  Stream<ShowState> resultGetData(Either<Failures, ListRestaurants> result) async*{
    yield result.fold(
            (failure) => ShowErrorState(),
            (response) => GetRestaurantState(listRestaurants: response));
  }
}
