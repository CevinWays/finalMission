import 'package:connectivity/connectivity.dart';

class CheckConnectionHelper {
  static Future<bool> funCheckConnection() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile){
      return true;
    }else if(connectivityResult == ConnectivityResult.wifi){
      return true;
    }else{
      return false;
    }
  }
}