import 'package:flutter/material.dart';
import 'package:flutter_retrofit_use/test/model/movie.dart';
import 'home_front_banner.dart';

class MovieBox extends StatelessWidget {
  final Movie movie;

  const MovieBox({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          movie.fullImageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: FrontBanner(text: movie.title),
        ),
      ],
    );
  }
}
