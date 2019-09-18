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
                            '${DateTime.now().month}月${DateTime.now().day}日 ' +
                                getWeekday(DateTime.now().weekday),
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
                        onPressed: () {},
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
                      Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Text(
                            todayInfo.subTitle,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            child: Text(
                              todayInfo.title,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.grey,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Text(
                            todayInfo.content,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(todayInfo.fontColor),
                                decoration: TextDecoration.none),
                          ),
                        ),
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

  String getWeekday(int weekday) {
    var strWeekday;
    switch (weekday) {
      case 1:
        strWeekday = "星期一";
        break;
      case 2:
        strWeekday = "星期二";
        break;
      case 3:
        strWeekday = "星期三";
        break;
      case 4:
        strWeekday = "星期四";
        break;
      case 5:
        strWeekday = "星期五";
        break;
      case 6:
        strWeekday = "星期六";
        break;
      case 7:
        strWeekday = "星期日";
        break;
    }

    return strWeekday;
  }
}
