import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


abstract class BaseWidget extends StatefulWidget {
  @override
  BaseWidgetState createState() => getState();

  ///子类实现
  BaseWidgetState getState();
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<T> {
  ScopedReader watch;


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return _buildWidgetDefault();
  }

  ///构建默认视图
  Widget _buildWidgetDefault() {
    ///使用appbar，也可直接只有 body 在 body 里自定义状态栏、标题栏
    return Consumer(builder: (context, watch, _) {
      this.watch=watch;
      final int staus = watch(buildProvider()).state;
      return WillPopScope(
        child: Scaffold(
          appBar: buildAppBar(),
          body: buildBody(staus),
        ),
        onWillPop: requestPop,
      );
    });
  }

  ///子类实现，构建各自页面UI控件 相当于setContentView()
  Widget buildWidget(BuildContext context,ScopedReader watch);
  StateProvider buildProvider();
  ///构建内容区
  Widget buildBody(int staus) {
    return Container(
      ///内容区背景颜色
      color: Colors.white,
      child: showWidget(staus),
    );
  }

  buildErrorWidget() {
    return Center(
      child: GestureDetector(
        child: Text('       ErrorWidget'),
        onTap: () => context.read(buildProvider()).state = 3,
      ),
    );
  }

  buildEmptyWidget() {
    return Center(
      child: GestureDetector(
        child: Text('       buildEmptyWidget'),
        onTap: () => context.read(buildProvider()).state = 4,
      ),
    );
  }

  buildLoadingWidget() {
    return Center(
      child: GestureDetector(
        child: Text('       buildLoadingWidget'),
        onTap: () => context.read(buildProvider()).state = 1,
      ),
    );
  }

  AppBar buildAppBar();

  DateTime _lastQuitTime;

  Future<bool> requestPop() async {
    if (_lastQuitTime == null ||
        DateTime.now().difference(_lastQuitTime).inSeconds > 1) {
      print('再按一次 Back 按钮退出');
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('再按一次 Back 按钮退出')));
      _lastQuitTime = DateTime.now();
      return false;
    } else {
      print('退出');
      Navigator.of(context).pop(true);
      return true;
    }
  }

  Widget showWidget(int staus) {
    if (staus == 1) return buildWidget(context,watch);
    if (staus == 2) return buildErrorWidget();
    if (staus == 3) return buildEmptyWidget();
    if (staus == 4) return buildLoadingWidget();

  }
}
