import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_retrofit_use/test/provider/background_color_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class DarkModeSwitcher extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final darkModeStatusProvider = useProvider(darkModeProvider);
    return Switch(
      value: darkModeStatusProvider.isDarkModeEnabled,
      onChanged: (enabled) {
        if (enabled) {
          darkModeStatusProvider.setDarkMode();
        } else {
          darkModeStatusProvider.setLightMode();
        }
      },
    );
  }
}
