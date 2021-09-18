import 'package:dartz/dartz.dart';
import 'package:restaurant2/core/error/failures.dart';
import 'package:restaurant2/features/show/domain/entities/list_restaurants.dart';

abstract class ShowRepository {
  Future<Either<Failures,ListRestaurants>> getDataRestaurants();
}