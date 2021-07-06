import 'package:flutter/material.dart';
import 'package:flutter_retrofit_use/test/component/poster_movie_images.dart';
import 'package:flutter_retrofit_use/test/model/movie.dart';


class PosterView extends StatelessWidget {
  final List<Movie> movies;

  const PosterView({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
      ),
      child: GridView.extent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7,
        children: movies.map((movie) => PosterMovieImages(movie: movie)).toList(),
      ),
    );
  }
}
