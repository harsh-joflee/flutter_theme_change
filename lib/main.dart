import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/Theme/bloc/theme_bloc.dart';
import 'package:flutter_bloc_demo/bloc_observer.dart';
import 'package:flutter_bloc_demo/custom_theme_data.dart';

import 'Screens/home_page.dart';
import 'counter/bloc/counter_bloc.dart';

Future<void> main() async {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeBloc = ThemeBloc();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: themeBloc,
        ),
        BlocProvider(
          create: (context) => CounterBloc(themeBloc),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          CustomThemeData.setColors(state);
          return const MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}
