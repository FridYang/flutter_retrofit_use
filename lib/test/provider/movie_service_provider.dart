import 'package:dio/dio.dart';
import 'package:flutter_retrofit_use/test/ui/home/home_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'config_provider.dart';

final moviewServiceProvider = Provider<HomeViewModel>((ref) {
  // we pass config instance to access to the APIKey
  final config = ref.watch(environmentConfigProvider);

  return HomeViewModel(config, Dio());
});
