import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../Theme/bloc/theme_bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  final ThemeBloc _themeBloc;
  late final StreamSubscription themeSubscription;

  CounterBloc(this._themeBloc) : super(0) {
    themeSubscription = _themeBloc.stream.listen((mode) {
      mode == ThemeMode.dark ? emit(state + 1) : emit(state - 1);
    });
    on<Increment>((event, emit) {
      emit(state + 1);
    });
    on<Decrement>((event, emit) {
      emit(state - 1);
    });
  }

  @override
  Future<void> close() {
    themeSubscription.cancel();
    return super.close();
  }
}
