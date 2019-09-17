import 'package:flutter/material.dart';

import 'today_data.dart';
import 'today_detail.dart';

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '08:41 星期二',
                            style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.none,
                                color: Colors.black54),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                'Today',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                    ClipOval(
                      child: IconButton(
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.blue,
                          size: 30,
                        ),
                        padding: const EdgeInsets.only(top: 10),
                      ),
                    ),
                  ],
                ),
              ),
              createListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget createListView() {
    return ListView.builder(
      itemCount: todayList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return createItemView(index);
      },
    );
  }

  Widget createItemView(int index) {
    var todayInfo = todayList[index];

    var _scaleAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    var _scaleAnimation =
        Tween<double>(begin: 1, end: 0.98).animate(_scaleAnimationController);

    return GestureDetector(
      onPanDown: (details) {
        _scaleAnimationController.forward();
      },
      onPanCancel: () {
        _scaleAnimationController.reverse();
      },
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return TodayDetail();
            },
            fullscreenDialog: true,
            settings: RouteSettings(arguments: todayInfo)));
      },
      child: Container(
        height: 450,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Hero(
            tag: 'hero${todayInfo.title}',
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(
                      todayInfo.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        todayInfo.subTitle,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            decoration: TextDecoration.none),
                      ),
                      Expanded(
                        child: Text(
                          todayInfo.title,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey,
                              decoration: TextDecoration.none),
                        ),
                      ),
                      Text(
                        todayInfo.content,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(todayInfo.fontColor),
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
