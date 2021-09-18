import 'package:dartz/dartz.dart';
import 'package:restaurant2/core/error/failures.dart';
import 'package:restaurant2/features/search/domain/entities/search.dart';
import 'package:restaurant2/features/search/domain/repositories/search_repository.dart';

class GetSearchRestaurant {
  final SearchRepository searchRepository;

  GetSearchRestaurant({required this.searchRepository});

  Future<Either<Failures,Search>> getSearchRestaurants(String query) async{
    return await searchRepository.getSearch(query);
  }
}