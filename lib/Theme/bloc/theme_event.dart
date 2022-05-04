part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeModeChanged extends ThemeEvent {
  @override
  String toString() => "ThemeModeChanged()";

  final ThemeMode mode;
  ThemeModeChanged(this.mode);
}
