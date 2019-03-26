import 'package:flutter/material.dart';

class HomeGrid extends StatefulWidget {

  final String name;

  HomeGrid(this.name);

  @override
  _HomeGridState createState() => _HomeGridState(name);
}

class _HomeGridState extends State<HomeGrid> {
  List data = List();
  final String name;

  _HomeGridState(this.name);

  @override
  void initState() {
    super.initState();
    initData();
  }

  /*
  * 模拟数据
  */
  void initData() {
    data
      ..add({
        "name": "名称",
        "imageUrl": "http://p.pptfans.cn/2014/12/05/pptfans_7c710b81639af14.png"
      })
      ..add({
        "name": "名称",
        "imageUrl": "http://p.pptfans.cn/2014/12/05/pptfans_7c710b81639af14.png"
      })
      ..add({
        "name": "名称",
        "imageUrl": "http://p.pptfans.cn/2014/12/05/pptfans_7c710b81639af14.png"
      })
      ..add({
        "name": "名称",
        "imageUrl": "http://p.pptfans.cn/2014/12/05/pptfans_7c710b81639af14.png"
      })
      ..add({
        "name": "名称",
        "imageUrl": "http://p.pptfans.cn/2014/12/05/pptfans_7c710b81639af14.png"
      })
      ..add({
        "name": "名称",
        "imageUrl": "http://p.pptfans.cn/2014/12/05/pptfans_7c710b81639af14.png"
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // 图标和名称
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.movie_creation,
                  color: Colors.red,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(name),
                )
              ],
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 一行显示3列
              childAspectRatio: 1 / 1.6, //显示gridview的item的宽高比，默认1:1，正方形
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            shrinkWrap: true,
            itemCount: data == null ? 0 : data.length,
            physics: NeverScrollableScrollPhysics(), // 不滚动
            itemBuilder: (BuildContext context, int index) {
              return builderItem(data[index]);
            },
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12.0),
            margin:
                EdgeInsets.only(top: 12.0, bottom: 12.0, left: 8.0, right: 8.0),
            child: Center(
              child: Text(
                '查看更多'+name,
                style: TextStyle(fontSize: 12.0),
                maxLines: 1,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget builderItem(itemData) {
    return Material(
      borderRadius: BorderRadius.circular(7.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: ((MediaQuery.of(context).size.width - 60) / 3) / 3 * 4,
            width: (MediaQuery.of(context).size.width - 30) / 3,
            child: Image.network(
              itemData['imageUrl'],
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              itemData['name'],
              style: TextStyle(color: Colors.black87, fontSize: 14.0),
              maxLines: 1, //最大行数
            )),
          ),
        ],
      ),
    );
  }
}
