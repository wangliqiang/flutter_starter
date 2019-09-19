import 'package:flutter/material.dart';

import 'anim/animation.dart';
import 'appbar/bottom_appbar.dart';
import 'beautycard/beauty_card.dart';
import 'character/character_list.dart';
import 'creditcard/credit_card.dart';
import 'keepalivestate/keep_alive_state.dart';
import 'searchbar/search_bar.dart';
import 'tabbar/bottom_tabbar.dart';
import 'today/today.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Starter',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Starter'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => bottomTabbar(),
                    ),
                  );
                },
                child: Text('底部导航栏'),
                color: Colors.lightBlue,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => bottomAppBar(),
                    ),
                  );
                },
                child: Text('底部工具栏'),
                color: Colors.lightBlue,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstPage(),
                    ),
                  );
                },
                child: Text('路由动画'),
                color: Colors.lightBlue,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KeepAliveState(),
                    ),
                  );
                },
                child: Text('保持页面状态'),
                color: Colors.lightBlue,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchBar(),
                    ),
                  );
                },
                child: Text('SearchBar'),
                color: Colors.lightBlue,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => beautyCard(),
                    ),
                  );
                },
                child: Text('精美卡片'),
                color: Colors.lightBlue,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Today(),
                    ),
                  );
                },
                child: Text('AppStore Today 界面'),
                color: Colors.lightBlue,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CharacterList(),
                    ),
                  );
                },
                child: Text('神偷奶爸'),
                color: Colors.lightBlue,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreditCard(),
                    ),
                  );
                },
                child: Text('卡片动效'),
                color: Colors.lightBlue,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
