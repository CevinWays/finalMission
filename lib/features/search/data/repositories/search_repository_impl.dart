import 'package:restaurant2/features/search/data/datasources/network/search_restaurant_network_datasource.dart';
import 'package:restaurant2/features/search/data/mapper/search_mapper.dart';
import 'package:restaurant2/features/search/domain/entities/search.dart';
import 'package:restaurant2/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant2/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository{
  final SearchRestaurantNetworkDatasource searchRestaurantNetworkDatasource;

  SearchRepositoryImpl({required this.searchRestaurantNetworkDatasource});
  @override
  Future<Either<Failures, Search>> getSearch(String query) async{
    try{
      var result = await searchRestaurantNetworkDatasource.getNetworkDataSearchRestaurant(query);
      var resultMapper = SearchMapper.toEntity(result);
      return Right(resultMapper);
    }catch(e){
      return Left(ServerFailures());
    }
  }

}