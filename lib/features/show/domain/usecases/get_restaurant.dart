import 'package:dartz/dartz.dart';
import 'package:restaurant2/core/error/failures.dart';
import 'package:restaurant2/features/show/domain/entities/list_restaurants.dart';
import 'package:restaurant2/features/show/domain/repositories/show_repository.dart';

class GetRestaurant {
  final ShowRepository showRepository;

  GetRestaurant({required this.showRepository});

  Future<Either<Failures,ListRestaurants>> getRestaurant() async{
    return await showRepository.getDataRestaurants();
  }

  
}