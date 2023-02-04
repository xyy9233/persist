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
                const SizedBox(height: 0),
                buildHello(),
                /*Divider(
              color: Colors.black12,
              height: 20,
              thickness: 1,
            ),*/
                const SizedBox(height: 15),
                buildDate(),
                /*Divider(
              color: Colors.black12,
              height: 20,
              thickness: 1,
            ),*/
                const SizedBox(height: 30),
                buildAdd(),
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
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hi,XX',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 64.0,
                      color: Color.fromRGBO(73, 108, 251, 1),
                    ),
                  ),
                  Text(
                    'Where there is a will, there is a way.喵',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color.fromRGBO(118, 118, 118, 1) ,
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
      width: 393.w,
      height: 96.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          // 当前日期
          Text(
            DateFormat.yMMMd().format(DateTime.now()),
            style: TextStyle(
              fontSize: 24,
              color: Color.fromRGBO(134, 159, 249, 1),
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
                    width: 54.w,
                    height: 96.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color.fromRGBO(134, 159, 249, 1), width: 1)),
                    //margin: EdgeInsets.all(5),
                    child: TextButton(
                      child: Text(DateFormat.d().format(date),
                          style: TextStyle(
                            color: Color.fromRGBO(225, 225, 225, 1),
                            fontSize: 32.0,
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
        width: 393,
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
                        "09:00----------",
                        
                        textAlign: TextAlign.center,
                      ),
                    )
                        : SizedBox(),
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.transparent,
                       child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/jutierenwu.png"),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: Color.fromRGBO(73, 108, 251, 1),
                            width: 5.0,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),

                    ),
                    index % 2 == 1
                        ? Expanded(
                      child: Text(
                        "------------16:30",
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

  bool isVisible = false;
  Widget buildAdd() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 0, bottom: 0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            setState(() {
              isVisible = true;
            });
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                    child: Container(
                      height: 546,
                      width: 393,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/addpage.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(""),
                          const SizedBox(height: 400),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isVisible = false;
                              });
                            },
                            child: Text("ADDDD!"),
                          ),
                        ],
                      ),
                    ));
              },
            );
          },
          child: const Text("ADDD?",
              style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(207, 207, 207, 0))),
        ),
      ),
    );
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
