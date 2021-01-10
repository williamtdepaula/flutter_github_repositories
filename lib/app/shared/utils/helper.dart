import 'package:connectivity/connectivity.dart';

class Helper {
  static Future<bool> isConnected() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    return connectivityResult != ConnectivityResult.none;
  }
}
