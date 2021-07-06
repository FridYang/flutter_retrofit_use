import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'http/Api.dart';
import 'entity/MovieEntity.dart';
import 'ImageWidget.dart';
import 'http/BaseDio.dart';
import 'moviedetail.dart';
import 'refresh_provider_example.dart';
import 'temp_page.dart';

void main() {
  runApp(
    ProviderScope(//第二步
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterRetrofit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter retrofit use'),
        home: TempPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Subjects> mlist = [];

  // 当前的页数
  int _page = 1;

  // 每页显示多少条数据
  int _pagesize = 5;

  // 总数据条数
  int _total = 0;

  // 是否加载完毕了
  bool _isover = false;

  // 是否正在加载数据
  bool _isloading = true;
  ScrollController _scrollCtrl;

  // 保持当前页面的数据状态
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollCtrl = new ScrollController();
    _scrollCtrl.addListener(() {
      if (_scrollCtrl.position.pixels == _scrollCtrl.position.maxScrollExtent) {
        // print('滑动到了底部');
        // 是否正在加载中或所有数据加载完毕了
        if (_isloading || _isover) return;
        // 判断是否加载完毕了所有的数据
        if (_page * _pagesize >= _total) {
          setState(() {
            _isover = true;
          });
          return;
        }
        // 页码值自增 +1
        setState(() {
          _page++;
        });
        // 获取下一页数据
        getMovieList();
      }
    });
    getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: mlist.length,
        controller: _scrollCtrl,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              print(mlist[i].id);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext ctx) {
                return MovieDetail(
                  id: mlist[i].id,
                  title: mlist[i].title,
                );
              }));
            },
            child: Column(
              children: <Widget>[
                Divider(
                  height: 1,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  height: 170,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      Expanded(child:ImageWidget(url:mlist[i].images.small,w:130 ,)
                        // mlist[i].images.large,
                        // width: 130,
                        // fit: BoxFit.cover,
                     ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '电影名称：${mlist[i].title}',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text('电影类型：${mlist[i].genres.join('，')}',
                                  style: TextStyle(fontSize: 12)),
                              Text('上映年份：${mlist[i].year}年',
                                  style: TextStyle(fontSize: 12)),
                              Text('豆瓣评分：${mlist[i].rating.stars}分',
                                  style: TextStyle(fontSize: 12)),
                              Row(
                                children: <Widget>[
                                  Text('主演：', style: TextStyle(fontSize: 12)),
                                  Row(
                                    children: List.generate(
                                        mlist[i].casts.length,
                                            (int index) => Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 5),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                mlist[i].casts[index] ==
                                                    null
                                                    ? 'https://img3.doubanio.com/f/movie/8dd0c794499fe925ae2ae89ee30cd225750457b4/pics/movie/celebrity-default-medium.png'
                                                    : mlist[i]
                                                    .casts[index]),
                                          ),
                                        )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void getMovieList() async {
    setState(() {
      _isloading = true;
    });
    try {
      var movieEntity = await Api().getDataList(_page, _pagesize);
      var list = movieEntity.subjects;
      print(_page);
      list.forEach((element) {
        print(element.title);
      });
      setState(() {
        // 合并数组
        mlist.addAll(list);
        _total = movieEntity.total;
        _isloading = false;
      });
    }on DioError catch(e){
      BaseDio.getInstance().getDioError(e);
    }


  }

}
