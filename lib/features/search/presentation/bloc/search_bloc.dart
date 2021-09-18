import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant2/core/error/failures.dart';
import 'package:restaurant2/core/util/check_connection_helper.dart';
import 'package:restaurant2/features/search/domain/entities/search.dart';
import 'package:restaurant2/features/search/domain/usecases/get_search_restaurants.dart';
import 'package:restaurant2/features/show/domain/entities/restaurants.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchRestaurant getSearchRestaurant;

  SearchBloc({required this.getSearchRestaurant}) : super(SearchInitialState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if(event is GetSearchEvent)
    yield* _getSearchRestaurant(event.query);
  }

  Stream<SearchState> _getSearchRestaurant(String query) async*{
    yield SearchInitialState();
    yield LoadingState();

    bool isConnect = false;
    isConnect = await CheckConnectionHelper.funCheckConnection();
    var result;

    if(isConnect){
      result = await getSearchRestaurant.getSearchRestaurants(query);
      yield* resultGetData(result);
    }else{
      yield NetworkErrorState();
    }
  }

  Stream<SearchState> resultGetData(Either<Failures, Search> result) async*{
    yield result.fold(
            (failure) => SearchErrorState(),
            (response) => GetSearchState(listRestaurants: response.restaurants));
  }
}
