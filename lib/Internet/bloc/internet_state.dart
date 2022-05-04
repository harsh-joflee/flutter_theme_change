part of 'internet_bloc.dart';

//ENUM for ConnectionType

enum ConnectionType { internet, wifi, nothing }

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class MobileDataConnected extends InternetState {
  final ConnectionType connectionType;

  MobileDataConnected(this.connectionType);
}

class WifiConnected extends InternetState {
  final ConnectionType connectionType;

  WifiConnected(this.connectionType);
}

class Disconnected extends InternetState {
  final ConnectionType connectionType;

  Disconnected(this.connectionType);
}
