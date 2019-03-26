import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.movie_filter,
                    color: Colors.white,
                  ),
                ),
                Text('电影')
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.tv,
                    color: Colors.white,
                  ),
                ),
                Text('电视剧')
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.explore,
                    color: Colors.white,
                  ),
                ),
                Text('娱乐')
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.confirmation_number,
                    color: Colors.white,
                  ),
                ),
                Text('动漫')
              ],
            ),
          )
        ],
      ),
    );
  }
}
