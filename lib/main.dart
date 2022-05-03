import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/Theme/bloc/theme_bloc.dart';
import 'package:flutter_bloc_demo/bloc_observer.dart';
import 'package:flutter_bloc_demo/custom_theme_data.dart';

import 'counter/bloc/counter_bloc.dart';

Future<void> main() async {
  runApp(const MyApp());
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          CustomThemeData.setColors(state);
          return MaterialApp(
            title: 'Flutter Demo',
            home: const MyHomePage(title: 'Flutter Bloc Demo'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var cubit = '';
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomThemeData.scaffoldColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            widget.title,
            style: TextStyle(color: CustomThemeData.textColor),
          ),
          backgroundColor: CustomThemeData.appbarColor,
          actions: [
            Switch(
              onChanged: (isDarkMode) {
                setState(
                  () {
                    isDark = isDarkMode;
                    context.read<ThemeBloc>().add(
                          ThemeModeChanged(
                            isDarkMode ? ThemeMode.dark : ThemeMode.light,
                          ),
                        );
                  },
                );
              },
              value: isDark,
            )
          ],
        ),
        body: Container(
          child: Center(
            child: BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: TextStyle(
                    color: CustomThemeData.textColor,
                    fontSize: 50,
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: CustomThemeData.textColor,
              onPressed: () {
                context.read<CounterBloc>().add(Increment());
              },
              child: Icon(
                Icons.add,
                color: CustomThemeData.scaffoldColor,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              backgroundColor: CustomThemeData.textColor,
              onPressed: () {
                context.read<CounterBloc>().add(Decrement());
              },
              child: Icon(
                Icons.remove,
                color: CustomThemeData.scaffoldColor,
              ),
            ),
          ],
        ));
  }
}
