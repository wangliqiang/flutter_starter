import 'package:flutter/material.dart';
import 'tabbar/bottom_tabbar.dart';
import 'appbar/bottom_appbar.dart';
import 'anim/animation.dart';
import 'keepalivestate/keep_alive_state.dart';
import 'searchbar/search_bar.dart';
import 'beautycard/beauty_card.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Starter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Starter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomTabbarScreen(),
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
                      builder: (context) => BottomAppbarScreen(),
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
                      builder: (context) => AnimScreen(),
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
                      builder: (context) => KeepAliveStateScreen(),
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
                      builder: (context) => SearchBarScreen(),
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
                      builder: (context) => CardAnimScreen(),
                    ),
                  );
                },
                child: Text('精美卡片'),
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

/**
 * 底部导航栏
 */
class BottomTabbarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BottomTabbarScreen',
      home: bottomTabbar(),
    );
  }
}

/**
 * 不规则底部导航栏
 */
class BottomAppbarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BottomAppbarScreen',
      home: bottomAppBar(),
    );
  }
}

/**
 * 路由跳转动画
 */
class AnimScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BottomAppbarScreen',
      home: FirstPage(),
    );
  }
}

/**
 * 路由跳转动画
 */
class KeepAliveStateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KeepAliveState',
      home: KeepAliveState(),
    );
  }
}

/**
 * 搜索框
 */
class SearchBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SearchBar',
      home: SearchBar(),
    );
  }
}

/**
 * 精美卡片
 */
class CardAnimScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '精美卡片',
      home: beautyCard(),
    );
  }
}
