import 'package:flutter/material.dart';
import 'package:flutter_retrofit_use/test/provider/movie_future_provider.dart';
import 'package:flutter_riverpod/all.dart';


class ErrorBody extends StatelessWidget {
  const ErrorBody({
    Key key,
    @required this.message,
  })  : assert(message != null, 'null'),
        super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: () => context.refresh(homeViewModelFutureProvider),
            child: Text("重试"),
          ),
        ],
      ),
    );
  }
}
