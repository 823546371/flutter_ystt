import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_ystt/pages/home/home_grid.dart';
import 'dart:ui';

import 'package:flutter_ystt/pages/home/home_menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 轮播图数组
  List bannerList = [
    {
      "name": "轮播图1",
      "url": "",
      "imageUrl":
          "http://p.pptfans.cn/2014/12/05/pptfans_7c710b81639af14.png"
    },
    {
      "name": "轮播图2",
      "url": "",
      "imageUrl":
          "http://p.pptfans.cn/2014/12/05/pptfans_7c710b81639af14.png"
    }
  ];

  // 默认轮播图选中角标
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 310.0,
                child: Swiper.list(
                  list: bannerList, // 轮播数据源
                  index: selectIndex, //当前的索引
                  builder: (BuildContext context, dynamic data, int index) {
                    // 构建轮播图的布局
                    return getItem(bannerList[index]);
                  },
                  pagination: new SwiperPagination(
                      // 轮播图指示器
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 105)),
                  onIndexChanged: (int index) {
                    // 滚动事件监听
                    selectIndex = index;
                  },
                  autoplay: true, //是否自动播放
                ),
              ),
              Positioned(
                left: 10.0,
                right: 10.0,
                top: 220.0,
                child: HomeMenu(),
              ),
            ],
          ),
          HomeGrid('电影'),
          HomeGrid('电视剧'),
          HomeGrid('娱乐'),
          HomeGrid('动漫'),
        ],
      ),
    );
  }

  Widget getItem(bannerList) {
    return Stack(
      children: <Widget>[
        Container(
            child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250.0,
              child: Image.network(
                bannerList['imageUrl'],
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250.0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Opacity(
                  opacity: 0.6,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white30),
                  ),
                ),
              ),
            ),
          ],
        )),
        Positioned(
            top: 30,
            left: 70,
            right: 70,
            child: Column(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width - 140,
                    height: 110,
                    child: Image.network(
                      bannerList['imageUrl'],
                      fit: BoxFit.fill,
                    )),
                Container(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    bannerList['name'],
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
