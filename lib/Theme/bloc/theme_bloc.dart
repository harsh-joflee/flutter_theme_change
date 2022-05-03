import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<ThemeModeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(ThemeModeChanged event, Emitter<ThemeMode> emit) {
    switch (event.mode) {
      case ThemeMode.dark:
        emit(ThemeMode.dark);
        break;
      case ThemeMode.light:
        emit(ThemeMode.light);
        break;
      case ThemeMode.system:
        emit(ThemeMode.system);
        break;
    }
  }
}
