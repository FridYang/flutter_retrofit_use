import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_retrofit_use/test/model/movie.dart';
import '../../config.dart';
import 'movies_exception_view.dart';

class HomeViewModel extends ChangeNotifier {
  final Config _environmentConfig;
  final Dio _dio;

  HomeViewModel(this._environmentConfig, this._dio);

  Future<List<Movie>> getMovies() async {
    try {
      final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1",
      );
      final results = List<Map<String, dynamic>>.from(response.data['results']);
      List<Movie> movies = results
          .map((singleMovie) => Movie.fromMap(singleMovie))
          .toList(growable: false);
      return movies;
    } on DioError catch (dioError) {
      throw HomeExceptionView.fromDioError(dioError);
    }
  }
}
