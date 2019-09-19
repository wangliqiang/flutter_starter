import 'dart:math';

import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: screenHeight * 0.6,
          child: CardSlider(height: screenHeight * 0.6),
        ),
      ),
    );
  }
}

class CardSlider extends StatefulWidget {
  final double height;

  const CardSlider({Key key, this.height}) : super(key: key);

  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  double positionY_line1;
  double positionY_line2;
  List<CardInfo> _cardInfoList;

  double _middleAreaHeight;
  double _outsideCardInterval;
  double scrollOffsetY;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    positionY_line1 = widget.height * 0.1;
    positionY_line2 = positionY_line1 + 200;

    _middleAreaHeight = positionY_line2 - positionY_line1;
    _outsideCardInterval = 30;
    scrollOffsetY = 0;

    // 数据
    _cardInfoList = [
      CardInfo(
        userName: "ANDREW MITCHELL",
        leftColor: Colors.purpleAccent,
        rightColor: Colors.deepPurple,
      ),
      CardInfo(
        userName: "ANDREW MITCHELL",
        leftColor: Colors.green,
        rightColor: Colors.teal,
      ),
      CardInfo(
        userName: "ANDREW MITCHELL",
        leftColor: Colors.grey,
        rightColor: Colors.black,
      ),
      CardInfo(
        userName: "ANDREW MITCHELL",
        leftColor: Colors.blueAccent,
        rightColor: Colors.blue,
      ),
    ];

    // 区分首个数据展示
    for (var i = 0; i < _cardInfoList.length; i++) {
      CardInfo cardInfo = _cardInfoList[i];
      if (i == 0) {
        cardInfo.positionY = positionY_line1;
        cardInfo.opacity = 1.0;
        cardInfo.scale = 1.0;
        cardInfo.rotate = 1.0;
      } else {
        cardInfo.positionY = positionY_line2 + (i - 1) * 30;
        cardInfo.opacity = 0.7 - (i - 0.5) * 0.1;
        cardInfo.scale = 0.9;
        cardInfo.rotate = -60;
      }
    }

    _cardInfoList = _cardInfoList.reversed.toList();
  }

  // 卡片列表
  _buildCards() {
    List widgetList = [];
    for (CardInfo cardInfo in _cardInfoList) {
      widgetList.add(
        Positioned(
          top: cardInfo.positionY,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(pi / 180 * cardInfo.rotate)
              ..scale(cardInfo.scale),
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: cardInfo.opacity,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: positionY_line2 - positionY_line1 - 20,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      cardInfo.leftColor,
                      cardInfo.rightColor,
                    ],
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    // card number
                    Positioned(
                      top: (positionY_line2 - positionY_line1) * 0.5,
                      left: 20,
                      child: Text(
                        "622 828 **** 0278",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // user name
                    Positioned(
                      top: (positionY_line2 - positionY_line1) * 0.6,
                      left: 20,
                      child: Text(
                        cardInfo.userName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // card logo
                    Positioned(
                      bottom: (positionY_line2 - positionY_line1) * 0.02,
                      right: 20,
                      child: Image.asset(
                        "assets/images/master_card_logo.png",
                        height: 100,
                        width: 80,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    return widgetList;
  }

  // 滑动操作
  _updateCardsPosition(double offsetY) {
    void updatePosition(
        CardInfo cardInfo, double firstCardAreaIdx, int cardIndex) {
      double currentCardAtAtreadIds = firstCardAreaIdx + cardIndex;
      if (currentCardAtAtreadIds < 0) {
        cardInfo.positionY =
            positionY_line1 + currentCardAtAtreadIds * _outsideCardInterval;

        cardInfo.rotate = -90.0 /
            _outsideCardInterval *
            (positionY_line1 - cardInfo.positionY);
        if (cardInfo.rotate > 0.0) cardInfo.rotate = 0.0;
        if (cardInfo.rotate < -90.0) cardInfo.rotate = -90.0;

        cardInfo.scale = 1.0 -
            0.2 / _outsideCardInterval * (positionY_line1 - cardInfo.positionY);
        if (cardInfo.scale < 0.8) cardInfo.scale = 0.8;
        if (cardInfo.scale > 1.0) cardInfo.scale = 1.0;

        cardInfo.opacity = 1.0 -
            0.73 /
                _outsideCardInterval *
                (positionY_line1 - cardInfo.positionY);
        if (cardInfo.opacity < 0.0) cardInfo.opacity = 0.0;
        if (cardInfo.opacity > 1.0) cardInfo.opacity = 1.0;
      } else if (currentCardAtAtreadIds >= 0 && currentCardAtAtreadIds < 1) {
        cardInfo.positionY =
            positionY_line1 + currentCardAtAtreadIds * _middleAreaHeight;

        cardInfo.rotate = -60.0 /
            (positionY_line2 - positionY_line1) *
            (cardInfo.positionY - positionY_line1);
        if (cardInfo.rotate > 0.0) cardInfo.rotate = 0.0;
        if (cardInfo.rotate < -60.0) cardInfo.rotate = -60.0;

        cardInfo.scale = 1.0 -
            0.1 /
                (positionY_line2 - cardInfo.positionY) *
                (cardInfo.positionY - positionY_line1);
        if (cardInfo.scale < 0.9) cardInfo.scale = 0.9;
        if (cardInfo.scale > 1.0) cardInfo.scale = 1.0;

        cardInfo.opacity = 1.0 -
            0.3 /
                (positionY_line2 - positionY_line1) *
                (cardInfo.positionY - positionY_line1);
        if (cardInfo.opacity < 0.0) cardInfo.opacity = 0.0;
        if (cardInfo.opacity > 1.0) cardInfo.opacity = 1.0;
      } else if (currentCardAtAtreadIds >= 1) {
        cardInfo.positionY = positionY_line2 +
            (currentCardAtAtreadIds - 1) * _outsideCardInterval;

        cardInfo.rotate = -60;
        cardInfo.scale = 0.9;
        cardInfo.opacity = 0.7;
      }
      cardInfo.positionY += offsetY;
    }

    scrollOffsetY += offsetY;

    double firstCardAreaIdx = scrollOffsetY / _middleAreaHeight;

    for (var i = 0; i < _cardInfoList.length; i++) {
      CardInfo cardInfo = _cardInfoList[_cardInfoList.length - 1 - i];
      updatePosition(cardInfo, firstCardAreaIdx, i);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails d) {
        _updateCardsPosition(d.delta.dy);
      },
      onVerticalDragEnd: (DragEndDetails d) {
        scrollOffsetY =
            (scrollOffsetY / _middleAreaHeight).round() * _middleAreaHeight;
        _updateCardsPosition(0);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 230, 228, 232),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // title
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: positionY_line1 / 4.5),
                child: Text(
                  "YOUR CREDIT CARD",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: "WorkSans",
                      color: Colors.grey.shade700),
                ),
              ),
            ),
            // card list
            ..._buildCards(),
            // 遮罩层
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(0, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                    ],
                  ),
                ),
              ),
            ),
            // bottom btn
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FloatingActionButton(
                        mini: true,
                        heroTag: "keyboard",
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: Icon(
                          Icons.keyboard,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Container(
                          width: 220,
                          height: 45,
                          decoration: ShapeDecoration(
                            color: Colors.blue,
                            shape: StadiumBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color.fromARGB(100, 75, 136, 230),
                                blurRadius: 10,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Confirm \$4233",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "WorkSans",
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        mini: true,
                        heroTag: "mic",
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: Icon(
                          Icons.mic,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInfo {
  String userName;
  String cardCategory;
  double positionY = 0;
  double rotate = 0;
  double scale = 0;
  double opacity = 0;
  Color leftColor;
  Color rightColor;

  CardInfo({
    this.userName,
    this.cardCategory,
    this.positionY,
    this.rotate,
    this.scale,
    this.leftColor,
    this.rightColor,
    this.opacity,
  });
}
