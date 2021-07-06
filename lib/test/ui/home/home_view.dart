import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_retrofit_use/test/component/darkmode_switcher.dart';
import 'package:flutter_retrofit_use/test/component/home_error_body.dart';
import 'package:flutter_retrofit_use/test/component/home_movie_box.dart';
import 'package:flutter_retrofit_use/test/provider/movie_future_provider.dart';
import 'package:flutter_retrofit_use/test/ui/poster/poster_view.dart';
import 'package:hooks_riverpod/all.dart';


import 'movies_exception_view.dart';

class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final viewModelFutureProvider = useProvider(homeViewModelFutureProvider);
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          elevation: 0,
          centerTitle: true,
          title: Text('Riverpod Recommended Movies'),
          actions: [
            DarkModeSwitcher(),
          ],
        ),
        body: viewModelFutureProvider.when(
          error: (e, s) {
            if (e is HomeExceptionView) {
              return ErrorBody(message: e.message);
            }
            return ErrorBody(
                message: "Sorry, something went wrong PLS TRY AGAIN!");
          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          // when data comes...
          data: (movies) {
            return RefreshIndicator(
              onRefresh: () {
                return context.refresh(homeViewModelFutureProvider);
              },
              // actual UI
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PosterView(movies: movies),
                    ),
                  );
                },
                child: GridView.extent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                  children: movies.map((movie) => MovieBox(movie: movie)).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
