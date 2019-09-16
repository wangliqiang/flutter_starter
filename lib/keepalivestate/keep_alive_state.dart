import 'package:flutter/material.dart';
import 'keep_alive_layout.dart';

class KeepAliveState extends StatefulWidget {
  @override
  _KeepAliveStateState createState() => _KeepAliveStateState();
}

class _KeepAliveStateState extends State<KeepAliveState>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keep Alive'),
        bottom: TabBar(controller: _controller, tabs: [
          Tab(
            icon: Icon(Icons.directions_car),
          ),
          Tab(
            icon: Icon(Icons.directions_transit),
          ),
          Tab(
            icon: Icon(Icons.directions_bike),
          ),
        ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          KeepAliveLayout(),
          KeepAliveLayout(),
          KeepAliveLayout(),
        ],
      ),
    );
  }
}
