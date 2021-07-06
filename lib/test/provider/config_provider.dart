import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config.dart';

// Global accessable test.provider that return the value of APIKey
// Since the Api is never change during runtime so we simply use provier

// This is the root of Riverpod Provider
final environmentConfigProvider = Provider<Config>((ref) {
  return Config();
});
