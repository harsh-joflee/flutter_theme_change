import 'dart:developer';

import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('onError :- ${bloc.runtimeType} -- $error -- $stackTrace');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition :- $transition');
  }
}
