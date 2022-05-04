part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}

class ConnectionModeChanged extends InternetEvent {
  @override
  String toString() => "ThemeModeChanged()";

  final Connectivity connectivity;
  ConnectionModeChanged(this.connectivity);
}

// class WifiConnected extends InternetEvent {
//   @override
//   String toString() => "Increment()";
// }

// class MobileConnected extends InternetEvent {
//   @override
//   String toString() => "Decrement()";
// }

// class NoConnected extends InternetEvent {
//   @override
//   String toString() => "Decrement()";
// }
