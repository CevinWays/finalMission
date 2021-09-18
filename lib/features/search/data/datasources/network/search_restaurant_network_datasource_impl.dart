import 'package:dio/dio.dart';
import 'package:restaurant2/core/util/constant_helper.dart';
import 'package:restaurant2/core/util/dio_helper.dart';
import 'package:restaurant2/features/search/data/datasources/network/search_restaurant_network_datasource.dart';
import 'package:restaurant2/features/search/data/models/search_model.dart';

class SearchRestaurantNetworkDatasourceImpl extends SearchRestaurantNetworkDatasource{
  @override
  Future<SearchModel> getNetworkDataSearchRestaurant(String query) async{
    SearchModel _searchModel;
    Response _response = await DioHelper.dio!.get(ConstantHelper.GET_SEARCH_RESTAURANT + query);

    _searchModel = SearchModel.fromJson(_response.data);

    return _searchModel;
  }
  
}