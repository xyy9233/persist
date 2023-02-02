import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  get items => 1;

  @override
  Widget build(BuildContext context) {
    getImage("assets/page1.png");
    return Scaffold(

        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/page1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 30),
                buildHello(),
                /*Divider(
              color: Colors.black12,
              height: 20,
              thickness: 1,
            ),*/
                const SizedBox(height: 30),
                buildDate(),
                /*Divider(
              color: Colors.black12,
              height: 20,
              thickness: 1,
            ),*/
                const SizedBox(height: 50),
                buildDailyPlan(),
                /*Divider(
                  color: Colors.black12,
                  height: 20,
                  thickness: 1,
                ),*/
              ]),
        ));
  }

  Widget buildHello() {
    return Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hello!\$_name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.indigo,
                    ),
                  ),
                  Text(
                    'www加油喵',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                width: 10.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  /*image: DecorationImage(
                image: NetworkImage(
                    //'https://img.duotegame.com/article/contents/2022/10/17/2022101795825615.png'
                  ),
                fit: BoxFit.cover,
              ),*/
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildDate() {
    return Container(
      width: 100,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 当前日期
          Text(
            DateFormat.yMMMd().format(DateTime.now()),
            style: TextStyle(
              fontSize: 20,
              color: Colors.indigoAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          // 五个按钮
          Expanded(
            child: Row(
              //
              children: List.generate(5, (index) {
                // 从右往左是当前日到七天前
                var date = DateTime.now().subtract(Duration(days: index));
                return Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1)),
                    margin: EdgeInsets.all(5),
                    child: TextButton(
                      child: Text(DateFormat.d().format(date),
                          style: TextStyle(
                            color: Color.fromRGBO(100, 100, 100, 1),
                            fontSize: 30.0,
                          )),
                      onPressed: () {
                        print(
                            'Pressed button for date: ${DateFormat.yMMMd().format(date)}');
                      },
                    ));
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDailyPlan() {
    return Container(
        width: 300,
        height: 700,
        child: Container(
          child: ListView.builder(
            itemCount: 18,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 180,
                child: Row(
                  children: <Widget>[
                    index % 2 == 0
                        ? Expanded(
                      child: Text(
                        "偶数行----------",
                        textAlign: TextAlign.center,
                      ),
                    )
                        : SizedBox(),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 100,
                    ),
                    index % 2 == 1
                        ? Expanded(
                      child: Text(
                        "------------奇数行",
                        textAlign: TextAlign.center,
                      ),
                    )
                        : SizedBox(),
                  ],
                ),
              );
            },
          ),
        ));
  }
}

//手势检测
/*class _GestureTestState extends State<GestureTest> {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 100.0,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateText("Tap"), //点击
        onDoubleTap: () => updateText("DoubleTap"), //双击
        onLongPress: () => updateText("LongPress"), //长按
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}*/
Widget getImage(String imageUrl) {
  return Image.asset(imageUrl);
}
