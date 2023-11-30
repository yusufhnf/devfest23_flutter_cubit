import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../modules/home/presentation/pages/home_screen.dart';
import '../app.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<AppCubit>(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            themeMode: state.themeMode,
            darkTheme: ThemeData.dark(),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
