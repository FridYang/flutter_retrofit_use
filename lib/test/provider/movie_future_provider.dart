// the test.provider will return list of movies
// 1. movieService: Get an instance
// 2. Access to the method which will return
import 'package:flutter_retrofit_use/test/model/movie.dart';
import 'package:hooks_riverpod/all.dart';


import 'movie_service_provider.dart';

final homeViewModelFutureProvider = FutureProvider.autoDispose<List<Movie>>((ref) async {
  //这个参数默认为false。如果用户离开页面并且请求失败，下次则将再次执行该请求。
  // 但是，如果请求成功完成（maintainState为true），则将保留状态，下次重新进入页面时不会触发新的请求。
  ref.maintainState = true;
  final movieService = ref.watch(moviewServiceProvider);
  final movies = await movieService.getMovies();
  return movies;
});
