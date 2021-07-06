import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';

final darkModeProvider = ChangeNotifierProvider<BackGroundColor>((ref) {
  return BackGroundColor();
});

class BackGroundColor extends ChangeNotifier {
  bool isDarkModeEnabled = true;

  void setLightMode() {
    isDarkModeEnabled = false;
    notifyListeners();
  }

  void setDarkMode() {
    isDarkModeEnabled = true;
    notifyListeners();
  }
}
