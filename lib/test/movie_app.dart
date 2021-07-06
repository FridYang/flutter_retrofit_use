import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'apptheme.dart';
import 'provider/background_color_provider.dart';
import 'ui/home/home_view.dart';

class MovieApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final backGroundController = useProvider(darkModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moview App with Riverpod Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: backGroundController.isDarkModeEnabled
          ? ThemeMode.dark
          : ThemeMode.light,
      home: HomeView(),
    );
  }
}
