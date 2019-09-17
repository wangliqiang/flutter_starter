import 'package:flutter/material.dart';

import 'today_data.dart';

class TodayDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Today todayInfo = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'hero${todayInfo.title}',
              child: Container(
                height: 500,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      todayInfo.imageUrl,
                      fit: BoxFit.cover,
                      height: 500,
                    ),
                    SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, top: 10, bottom: 18.0, right: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  todayInfo.subTitle,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      decoration: TextDecoration.none),
                                ),
                                Material(
                                  elevation: 1,
                                  borderRadius: BorderRadius.circular(30),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: IconButton(
                                      padding: EdgeInsets.all(5),
                                      icon: Icon(
                                        Icons.close,
                                        size: 20,
                                      ),
                                      alignment: Alignment.topLeft,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Text(
                                todayInfo.title,
                                style: TextStyle(
                                    fontSize: 30.0,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                todayInfo.content,
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
