import 'package:get_it/get_it.dart';
import 'package:restaurant2/features/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:restaurant2/features/search/data/datasources/network/search_restaurant_network_datasource.dart';
import 'package:restaurant2/features/search/data/datasources/network/search_restaurant_network_datasource_impl.dart';
import 'package:restaurant2/features/search/data/repositories/search_repository_impl.dart';
import 'package:restaurant2/features/search/domain/repositories/search_repository.dart';
import 'package:restaurant2/features/search/domain/usecases/get_search_restaurants.dart';
import 'package:restaurant2/features/search/presentation/bloc/search_bloc.dart';
import 'package:restaurant2/features/show/data/datasources/restaurant_network_data_source.dart';
import 'package:restaurant2/features/show/data/datasources/restaurant_network_data_source_impl.dart';
import 'package:restaurant2/features/show/data/repositories/show_repository_impl.dart';
import 'package:restaurant2/features/show/domain/repositories/show_repository.dart';
import 'package:restaurant2/features/show/domain/usecases/get_restaurant.dart';
import 'package:restaurant2/features/show/presentation/bloc/show_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async{
  ///Bloc
  sl.registerFactory(() => ShowBloc(getRestaurant: sl()));
  sl.registerFactory(() => SearchBloc(getSearchRestaurant: sl()));
  sl.registerFactory(() => FavouriteBloc());
  ///usecase
  sl.registerLazySingleton(() => GetRestaurant(showRepository: sl()));
  sl.registerLazySingleton(() => GetSearchRestaurant(searchRepository: sl()));
  ///repositories
  sl.registerLazySingleton<ShowRepository>(() => ShowRepositoryImpl(restaurantNetworkDataSource: sl()));
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(searchRestaurantNetworkDatasource: sl()));
  ///datasource
  sl.registerLazySingleton<RestaurantNetworkDataSource>(() => RestaurantNetworkDataSourceImpl());
  sl.registerLazySingleton<SearchRestaurantNetworkDatasource>(() => SearchRestaurantNetworkDatasourceImpl());
}