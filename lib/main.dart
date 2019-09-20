import 'package:flutter/material.dart';

import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Starter',
      routes: routes,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Starter'),
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        height: screenHeight,
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
        ),
        child: GridView.builder(
            itemCount: pageList.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //单个子Widget的水平最大宽度
                maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                childAspectRatio: 2,
                //水平单个子Widget之间间距
                mainAxisSpacing: 0,
                //垂直单个子Widget之间间距
                crossAxisSpacing: 0),
            itemBuilder: (context, index) {
              return itemView(context, screenHeight, index);
            }),
//        child: ListView.builder(
//          itemCount: pageList.length,
//          itemBuilder: (context, index) {
//            return itemView(context, screenHeight, index);
//          },
//        ),
      ),
    );
  }
}

// ItemView
Widget itemView(BuildContext context, double screenHeight, int index) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, pageList[index].route);
    },
    child: Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            height: screenHeight / 9,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: screenHeight / 7,
                    child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 8, right: 2),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: pageList[index].title,
                                style: TextStyle(
                                  fontFamily: "WorkSans",
                                  fontSize: 15,
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(text: "\n"),
                              TextSpan(
                                text: pageList[index].subTitle,
                                style: TextStyle(
                                  fontFamily: "WorkSans",
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: screenHeight / 8 / 5,
          left: 10,
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
                offset: Offset(0, 1),
              ),
            ]),
            child: Image.network(
              pageList[index].imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );
}
