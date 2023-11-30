import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../app/app.dart';
import '../../../notification/presentation/pages/notification_screen.dart';
import '../../../tweet/presentation/pages/tweet_screen.dart';
import '../cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final navigationItem = [const TweetScreen(), const NotificationScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocProvider.value(
          value: GetIt.I<HomeCubit>(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, homeState) {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text("Flutwit"),
                  actions: [
                    IconButton(
                        onPressed: () => GetIt.I<AppCubit>().changeThemeMode(),
                        icon: Icon(appState.themeMode == ThemeMode.dark
                            ? Icons.light_mode
                            : Icons.dark_mode))
                  ],
                ),
                body: SafeArea(child: navigationItem[homeState.currentIndex]),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: homeState.currentIndex,
                  onTap: (value) =>
                      GetIt.I<HomeCubit>().changeIndex(selectedIndex: value),
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Tweet',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.notifications),
                      label: 'Notification',
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
