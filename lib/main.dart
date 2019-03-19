import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '影视天堂',
      debugShowCheckedModeBanner: false, // 去掉右上角的 debug 的角标
      theme: ThemeData(
        primarySwatch: Colors.red, // 设置主题颜色
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('影视天堂'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                print('search');
              },
              tooltip: '搜索',
            )
          ],
          bottom: TabBar(
            labelPadding: EdgeInsets.all(8.0),
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.white54,
            tabs: <Widget>[
              Text('全部'),
              Text('电影'),
              Text('电视剧'),
              Text('动漫'),
              Text('综艺'),
            ],
          ),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: null,
              accountName: null,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://p.pptfans.cn/2014/12/05/pptfans_7c710b81639af14.png'),
                      fit: BoxFit.fill)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('首页'),
              onTap: () {
                print('home');
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('历史记录'),
              onTap: () {
                print('history');
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('收藏'),
              onTap: () {
                print('favorite');
              },
            ),
            ListTile(
              leading: Icon(Icons.color_lens),
              title: Text('主题颜色'),
              onTap: () {
                print('theme-color');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
              onTap: () {
                print('settings');
              },
            ),
          ],
        )),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text('首页'),
            ),
            Center(
              child: Text('电影'),
            ),
            Center(
              child: Text('电视剧'),
            ),
            Center(
              child: Text('动漫'),
            ),
            Center(
              child: Text('综艺'),
            ),
          ],
        ),
      ),
    );
  }
}
