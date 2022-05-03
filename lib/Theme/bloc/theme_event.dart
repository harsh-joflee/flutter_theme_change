part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeModeChanged extends ThemeEvent {
  final ThemeMode mode;
  ThemeModeChanged(this.mode);
}
