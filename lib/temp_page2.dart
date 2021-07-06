import 'package:flutter/material.dart';
import 'package:flutter_retrofit_use/base_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<int> stateProvider = StateProvider((_) => 1);

class TempPage2 extends BaseWidget {
  @override
  BaseWidgetState getState() {
    return _TempPage2();
  }
}

class _TempPage2 extends BaseWidgetState<TempPage2> {
  @override
  Widget buildWidget(BuildContext context, ScopedReader watch) {
    return Center(
      child: GestureDetector(
        child: Text('_TempPage2'),
        onTap: () => context.read(stateProvider).state = 4,
      ),
    );
  }

  @override
  AppBar buildAppBar() {
    return AppBar(
      title: Text('基类封装'),
    );
  }

  @override
  StateProvider buildProvider() {
    return stateProvider;
  }
}
