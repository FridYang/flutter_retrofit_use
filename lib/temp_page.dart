import 'package:flutter/material.dart';
import 'package:flutter_retrofit_use/base_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'temp_page2.dart';

final StateProvider<int> stateProvider = StateProvider((_) {
  
});

class TempPage extends BaseWidget {
  @override
  BaseWidgetState getState() {
    return _TempPage();
  }
}

class _TempPage extends BaseWidgetState<TempPage> {
  @override
  Widget buildWidget(BuildContext context, ScopedReader watch) {
    return Center(
      child: GestureDetector(
        child: Text('_TempPage'),
        onTap: () {
          context.read(stateProvider).state = 4;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext ctx) {
            return TempPage2();
          }));
        },
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
