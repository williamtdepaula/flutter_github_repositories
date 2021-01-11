import 'package:connectivity/connectivity.dart';
import 'package:flutter_github_repositories/app/shared/utils/network/network_interface.dart';

class Network implements INetwork {
  @override
  Future<bool> isConnected() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    return connectivityResult != ConnectivityResult.none;
  }
}
