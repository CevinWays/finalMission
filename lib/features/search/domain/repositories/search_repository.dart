import 'package:dartz/dartz.dart';
import 'package:restaurant2/core/error/failures.dart';
import 'package:restaurant2/features/search/domain/entities/search.dart';

abstract class SearchRepository {
  Future<Either<Failures,Search>> getSearch(String query);
}