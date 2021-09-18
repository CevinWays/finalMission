import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  List<Object?> get props => throw UnimplementedError();
}

class ServerFailures extends Failures{
  List<Object?> get props => throw UnimplementedError();
}

class LocalFailures extends Failures{
  List<Object?> get props => throw UnimplementedError();
}