import 'package:flutter/material.dart';

import '../pages/each_view.dart';

class bottomAppBar extends StatefulWidget {
  @override
  _BottomAppBarState createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<bottomAppBar> {
  List<Widget> _eachView;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    _eachView = List();
    _eachView
      ..add(EachView('Home'))
      ..add(EachView('Email'))
      ..add(EachView('Pages'))
      ..add(EachView('Airplay'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return EachView('New Page');
            }),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.email),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
              padding: EdgeInsets.fromLTRB(0, 0, 80, 0),
            ),
            IconButton(
              icon: Icon(Icons.pages),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 2;
                });
              },
              padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
            ),
            IconButton(
              icon: Icon(Icons.airplay),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
