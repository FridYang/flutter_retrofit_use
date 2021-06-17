import 'package:flutter_retrofit_use/entity/MovieDetailEntity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'entity/MovieEntity.dart';
part 'Api.g.dart';

// Step 1: flutter pub upgrade
// Step 2: flutter pub run build_runner build
// http://www.liulongbin.top:3005/api/v2/movie/coming_soon?start=0&count=1
@RestApi(baseUrl: 'http://www.liulongbin.top:3005/api/v2/movie/')
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;


  @GET('coming_soon?')
  Future<MovieEntity> getDataList(
      @Query('start') int start,
      @Query('count') int count
      );

  // 获取电影详情
  @GET('subject/{id}')
  Future<MovieDetailEntity> getMovieDetail( @Path('id') String id);

}

var client = Api(Dio());






