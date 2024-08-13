import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo{

  @override
  // TODO: implement isConnected
  Future<bool> get isConnected =>  InternetConnectionChecker().hasConnection;

}