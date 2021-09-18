import 'package:restaurant2/features/show/data/datasources/restaurant_network_data_source.dart';
import 'package:restaurant2/features/show/data/mapper/list_restaurant_mapper.dart';
import 'package:restaurant2/features/show/domain/entities/list_restaurants.dart';
import 'package:restaurant2/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant2/features/show/domain/repositories/show_repository.dart';

class ShowRepositoryImpl extends ShowRepository {
  final RestaurantNetworkDataSource restaurantNetworkDataSource;

  ShowRepositoryImpl({required this.restaurantNetworkDataSource});

  @override
  Future<Either<Failures, ListRestaurants>> getDataRestaurants() async{
    try{
      var result = await restaurantNetworkDataSource.getNetworkDataRestaurant();
      var resultMapper = ListRestaurantMapper.toEntity(result);
      return Right(resultMapper);
    }catch(e){
      return Left(ServerFailures());
    }
  }
  
}