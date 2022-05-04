import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Theme/bloc/theme_bloc.dart';
import '../counter/bloc/counter_bloc.dart';
import '../custom_theme_data.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomThemeData.scaffoldColor,
        appBar: AppBar(
          foregroundColor: CustomThemeData.textColor,
          elevation: 0,
          title: Text(
            'Second Screen',
            style: TextStyle(color: CustomThemeData.textColor),
          ),
          backgroundColor: CustomThemeData.appbarColor,
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          //     child: Column(
          //       children: [
          //         Center(
          //           child: Text(
          //             isDark ? 'Dark Mode' : 'Light Mode',
          //             style: TextStyle(
          //                 color: CustomThemeData.textColor, fontSize: 10),
          //           ),
          //         ),
          //         CupertinoSwitch(
          //           value: isDark,
          //           activeColor: Colors.white24,
          //           thumbColor: Colors.white,
          //           trackColor: Colors.black12,
          //           onChanged: (isDarkMode) {
          //             setState(
          //               () {
          //                 isDark = isDarkMode;
          //                 context.read<ThemeBloc>().add(
          //                       ThemeModeChanged(
          //                         isDarkMode ? ThemeMode.dark : ThemeMode.light,
          //                       ),
          //                     );
          //               },
          //             );
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
          // ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: BlocBuilder<CounterBloc, int>(
                // buildWhen: (previous, current) => previous + current >= 20,
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
            CupertinoButton.filled(
              child: const Text('previous Screen'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: '3',
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
              heroTag: '4',
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
