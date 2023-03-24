import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persist/models/habit.dart';


class Page1 extends StatefulWidget {
  Page1({required Key key,required this.uid, required this.username}):super(key:key);
  final int uid;
  final String username;


  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  late Habit habit ;

  Future <void> getData()async{
    print("##");
    String dioUrl="http://8.130.41.221:8081/habit/userAllHabit?uid=${widget.uid}";
    print(dioUrl);
    Dio dio = Dio(
    )..interceptors.add(LogInterceptor(responseBody: true));
    var response = await dio.get(dioUrl);
    //print(response.data);
    habit = Habit.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),

      builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
        switch (asyncSnapshot.connectionState) {
          case ConnectionState.none:
            return Text('none');
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (asyncSnapshot.hasError)
              return Scaffold(
                  body: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/page1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(children: [
                      Positioned(
                        left: 12.0.w,
                        top: 25.0.h,
                        child: Container(
                          width: 393.w,
                          height: 88.h,
                          child: buildHiname(),
                        ),
                      ),
                      Positioned(
                        left: 13.0.w,
                        top: 104.0.h,
                        child: Container(
                          width: 393.w,
                          height: 31.h,
                          child: buildguli(),
                        ),
                      ),
                      Positioned(
                        left: 329.0.w,
                        top: 56.0.h,
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          child: buildavatar(),
                        ),
                      ),
                      Positioned(
                        left: 320.0.w,
                        top: 47.0.h,
                        child: Container(
                          width: 57.w,
                          height: 56.h,
                          child: getImage("assets/avatarkuang.png"),
                        ),
                      ),
                      Positioned(
                        left: 0.0.w,
                        top: 158.0.h,
                        child: Container(
                          width: 290.w,
                          height: 30.h,
                          child: buildDatenow(),
                        ),
                      ),
                      Positioned(
                        left: 300.0.w,
                        top: 160.0.h,
                        child: Container(
                          width: 86.w,
                          height: 30.h,
                          child: Text("2023",
                              style: TextStyle(
                                fontSize: 22,
                                color: Color.fromRGBO(134, 159, 249, 1),
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Positioned(
                        left: 15.0.w,
                        top: 134.0.h,
                        child: Container(
                          width: 378.w,
                          height: 167.h,
                          child: buildDatekuang(),
                        ),
                      ),
                      Positioned(
                        left: 27.0.w,
                        top: 193.0.h,
                        child: Container(
                          width: 324.w,
                          height: 96.h,
                          child: buildDate(),
                        ),
                      ),
                      Positioned(
                        left: 12.0.w,
                        top: 303.0.h,
                        child: Container(
                          width: 303.w,
                          height: 65.h,
                          child: buildtask(),
                        ),
                      ),
                      Positioned(
                        left: 332.0.w,
                        top: 320.0.h,
                        child: Container(
                          width: 45.w,
                          height: 45.h,
                          child: buildAdd(context),
                        ),
                      ),
                      Positioned(
                        left: 16.0.w,
                        top: 369.0.h,
                        child: Container(
                          width: 361.w,
                          height: 420.h,
                          child: Container(

                            child:Text("\n\n\n\n  还没有习惯噢，\n  快点击加号建立第一个习惯吧！",
                              style: TextStyle(
                                fontSize: 22,
                                color: Color.fromRGBO(73, 108, 251, 1),
                                fontWeight: FontWeight.bold,
                              )
                          ),)
                        ),
                      ),
                    ]),
                  ));
            else
              return Scaffold(
                  body: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/page1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(children: [
                      Positioned(
                        left: 12.0.w,
                        top: 25.0.h,
                        child: Container(
                          width: 393.w,
                          height: 88.h,
                          child: buildHiname(),
                        ),
                      ),
                      Positioned(
                        left: 13.0.w,
                        top: 104.0.h,
                        child: Container(
                          width: 393.w,
                          height: 31.h,
                          child: buildguli(),
                        ),
                      ),
                      Positioned(
                        left: 329.0.w,
                        top: 56.0.h,
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          child: buildavatar(),
                        ),
                      ),
                      Positioned(
                        left: 320.0.w,
                        top: 47.0.h,
                        child: Container(
                          width: 57.w,
                          height: 56.h,
                          child: getImage("assets/avatarkuang.png"),
                        ),
                      ),
                      Positioned(
                        left: 0.0.w,
                        top: 158.0.h,
                        child: Container(
                          width: 290.w,
                          height: 30.h,
                          child: buildDatenow(),
                        ),
                      ),
                      Positioned(
                        left: 300.0.w,
                        top: 160.0.h,
                        child: Container(
                          width: 86.w,
                          height: 30.h,
                          child: Text("2023",
                              style: TextStyle(
                                fontSize: 22,
                                color: Color.fromRGBO(134, 159, 249, 1),
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15.0.w,
                        top: 134.0.h,
                        child: Container(
                          width: 378.w,
                          height: 167.h,
                          child: buildDatekuang(),
                        ),
                      ),
                      Positioned(
                        left: 27.0.w,
                        top: 193.0.h,
                        child: Container(
                          width: 324.w,
                          height: 96.h,
                          child: buildDate(),
                        ),
                      ),
                      Positioned(
                        left: 12.0.w,
                        top: 303.0.h,
                        child: Container(
                          width: 303.w,
                          height: 65.h,
                          child: buildtask(),
                        ),
                      ),
                      Positioned(
                        left: 332.0.w,
                        top: 320.0.h,
                        child: Container(
                          width: 45.w,
                          height: 45.h,
                          child: buildAdd(context),
                        ),
                      ),
                      Positioned(
                        left: 16.0.w,
                        top: 369.0.h,
                        child: Container(
                          width: 361.w,
                          height: 420.h,
                          child: buildDailyPlan(),
                        ),
                      ),
                    ]),
                  ));
        }
      },
    );
  }



  Widget buildHiname() {
    return Container(
      child: Text(
        '你好,${widget.username}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 44.0,
          color: Color.fromRGBO(73, 108, 251, 1),
        ),
      ),
    );
  }

  Widget buildguli() {
    return Container(
      child: Text(
        '有志者事竟成.喵',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          color: Color.fromRGBO(118, 118, 118, 1),
        ),
      ),
    );
  }

  Widget buildavatar() {
    return Flex(direction: Axis.vertical, children: [
      Flexible(
        fit: FlexFit.tight,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  'https://img1.baidu.com/it/u=4120075661,439968901&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ]);
  }

  Widget buildDatenow() {
    return Container(
      child: Text(
        DateFormat.MMMM().format(DateTime.now()),
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 24,
          color: Color.fromRGBO(134, 159, 249, 1),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildDatekuang() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Datekuang.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildDate() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          // 六个按钮
          Expanded(
            child: Row(
              children: List.generate(6, (index) {
                var date = DateTime.now().add(Duration(days: index - 1));
                var today = DateTime.now();
                return Container(
                    width: 54.w,
                    height: 96.h,
                    decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.transparent, width: 1)),
                    child: TextButton(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10.h),
                          Text(
                            DateFormat.E().format(date),
                            style: TextStyle(
                              color: (date.day == today.day &&
                                  date.month == today.month &&
                                  date.year == today.year)
                                  ? Color.fromRGBO(73, 108, 251, 1)
                                  : Color.fromRGBO(225, 225, 225, 1),
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(DateFormat.d().format(date),
                              style: TextStyle(
                                color: (date.day == today.day &&
                                    date.month == today.month &&
                                    date.year == today.year)
                                    ? Color.fromRGBO(73, 108, 251, 1)
                                    : Color.fromRGBO(225, 225, 225, 1),
                                fontSize: 26.0,
                              ))
                        ],
                      ),
                      onPressed: () {
                        print(
                            'Pressed button for date: ${DateFormat.yMMMd()
                                .format(date)}');
                      },
                    ));
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildtask() {
    return Container(
      child: Text(
        '今日任务',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36.0,
          color: Color.fromRGBO(73, 108, 251, 1),
        ),
      ),
    );
  }

  Map<int, bool> _showOverlayMap = {};

  Widget buildDailyPlan() {
    return Container(
      child: ListView.builder(
        itemCount: habit.data.length,
        itemBuilder: (BuildContext context, int index) {
          bool showOverlay = _showOverlayMap[index] ?? false;
          return Container(
            margin: EdgeInsets.only(bottom: 0),
            height: 180.h,
            child: Row(
              children: <Widget>[
                index % 2 == 0
                    ? Expanded(
                    child: Text(
                      habit.data[index].name=="jutie00000"?"举铁":"乒乓",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                      ),
                    )
                )
                    : SizedBox(),
                GestureDetector(
                  onLongPressStart: (_) {
                    setState(() {
                      _showOverlayMap[index] = true;  // 长按开始，显示覆盖图片
                    });
                  },
                  onLongPressEnd: (_) {
                    setState(() {
                      _showOverlayMap[index] = false; // 长按结束，隐藏覆盖图片
                    });
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 100.r,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromRGBO(73, 108, 251, 1),
                                width: 5.0.w,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Image.asset(
                                "assets/${habit.data[index].icon}.png",
                                scale: 0.1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // 使用AnimatedContainer在圆环闭合时缩放并显示habitok.png图片
                      if (showOverlay)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          width: 200.r,
                          height: 200.r,
                          child: Center(
                            child: Image.asset(
                              "assets/wancheng.png",
                              width: 220.r,
                              height: 220.r,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                index % 2 == 1
                    ? Expanded(
                    child: Text(
                      habit.data[index].name=="jutie00000"?"举铁":"乒乓",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                      ),
                    ))
                    : SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }




  Widget buildAdd(context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Container(
              height: 542.h,
               decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/addpage.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: AddPage(),
              ),
            );
          },
        );
      },
      child: Container(
        height: 700.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/addquan.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget AddPage() {
    String habitName = '';
    String habitDays = '';
    String habitMotto = '';
    String selectedOption = '';
    List<String> options = [
      'option1',
      'option2',
      'option3',
      'option4',
      'option5',
      'option6'
    ];
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/addpage.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: [
              Positioned(
                left: 016.0.w,
                top: 20.0.h,
                child: Container(
                  width: 168.w,
                  height: 48.h,
                  child: TextField(
                    decoration: InputDecoration(labelText: '名称'),
                    onChanged: (value) {
                      setState(() {
                        habitName = value;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                left: 016.0.w,
                top: 20.0.h,
                child: Container(
                  width: 168.w,
                  height: 48.h,
                  child: TextField(
                    decoration: InputDecoration(labelText: '天数'),
                    onChanged: (value) {
                      setState(() {
                        habitDays = value;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                left: 016.0.w,
                top: 20.0.h,
                child: Container(
                  width: 168.w,
                  height: 48.h,
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Motto'),
                    onChanged: (value) {
                      setState(() {
                        habitMotto = value;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                left: 016.0.w,
                top: 20.0.h,
                child: Container(
                  width: 168.w,
                  height: 48.h,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: options.map((option) {
                      bool isSelected = selectedOption == option;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = option;
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: isSelected ? Colors.blue : Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/$option.png',
                            width: 10,
                            height: 10,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Positioned(
                  left: 016.0.w,
                  top: 20.0.h,
                  child: Container(
                      width: 168.w,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: _onPressed,
                        child: Text('添加'),
                      )))
            ])));
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
}


Future<void> _onPressed() async {
  print("##");
  String dioUrl = "http://8.130.41.221:8081/habit/userAllHabit?uid=12";
  print(dioUrl);
  Dio dio = Dio()..interceptors.add(LogInterceptor(responseBody: true));
  var response = await dio.get(dioUrl);
  //print(response.data);
  //habit = Habit.fromJson(response.data);
  //state = Habit.fromJson(response.data["state"]) as int;
}