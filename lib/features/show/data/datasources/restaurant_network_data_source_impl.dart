import 'package:dio/dio.dart';
import 'package:restaurant2/core/util/constant_helper.dart';
import 'package:restaurant2/core/util/dio_helper.dart';
import 'package:restaurant2/features/show/data/datasources/restaurant_network_data_source.dart';
import 'package:restaurant2/features/show/data/models/list_restaurants_model.dart';

class RestaurantNetworkDataSourceImpl extends RestaurantNetworkDataSource {
  @override
  Future<ListRestaurantsModel> getNetworkDataRestaurant() async{
    ListRestaurantsModel _listRestaurantsModel;
    Response _response = await DioHelper.dio!.get(ConstantHelper.GET_RESTAURANT);

    _listRestaurantsModel = ListRestaurantsModel.fromJson(_response.data);

    return _listRestaurantsModel;
  }
  
}