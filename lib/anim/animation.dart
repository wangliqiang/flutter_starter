import 'package:flutter/material.dart';
import 'anim_fade.dart';
import 'anim_scale.dart';
import 'anim_rotation.dart';
import 'anim_slide.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'FirstPage',
        ),
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(CustomRoute_Fade(SecondPage()));
              },
              child: Text('Fade'),
              color: Colors.deepPurple,
              textColor: Colors.white,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(CustomRoute_Scale(SecondPage()));
              },
              child: Text('Scale'),
              color: Colors.deepPurple,
              textColor: Colors.white,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(CustomRoute_Rotation(SecondPage()));
              },
              child: Text('Rotation'),
              color: Colors.deepPurple,
              textColor: Colors.white,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(CustomRoute_Slide(SecondPage()));
              },
              child: Text('Slide'),
              color: Colors.deepPurple,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text(
          'SecondPage',
        ),
        backgroundColor: Colors.pinkAccent,
        elevation: 4,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64,
          ),
        ),
      ),
    );
  }
}
