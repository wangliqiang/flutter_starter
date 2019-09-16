import 'package:flutter/material.dart';

class KeepAliveLayout extends StatefulWidget {
  @override
  _KeepAliveLayoutState createState() => _KeepAliveLayoutState();
}

class _KeepAliveLayoutState extends State<KeepAliveLayout>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点击增加数字'),
            Text(
              '${_counter}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
