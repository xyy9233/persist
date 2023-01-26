import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _pageOptions = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 10.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floatingActionButton: FloatingActionButton(
      //onPressed: () {},
      //child: Icon(Icons.add),
      // ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  //final GlobalKey _fromKey = GlobalKey<FormState>();
  //late String _day;
  //bool _isObscure = true;
  //Color _eyeColor = Colors.grey;

  get items => 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                //image: new DecorationImage(
                // fit: BoxFit.cover, image: AssetImage("assets/main_page_one.jpg")),
                ),
            child: Form(
              //key: _day, // 设置globalKey，用于后面获取FormStat
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 10),
                    buildHello(),
                    Divider(
                      color: Colors.black12,
                      height: 20,
                      thickness: 1,
                    ),
                    buildDate(),
                    Divider(
                      color: Colors.black12,
                      height: 20,
                      thickness: 1,
                    ),
                    buildDailyPlan(),
                    Divider(
                      color: Colors.black12,
                      height: 20,
                      thickness: 1,
                    ),
                  ]),
            )));
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
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.duotegame.com/article/contents/2022/10/17/2022101795825615.png'),
                fit: BoxFit.cover,
              ),
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
              fontSize: 30,
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
                    width: 60,
                    height: 60,
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
        height:400,
        child: Container(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                child: Row(
                  children: <Widget>[
                    index % 2 == 0
                        ? Expanded(
                      child: Text(
                        "偶数行",
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
                        "奇数行",
                        textAlign: TextAlign.center,
                      ),
                    )
                        : SizedBox(),
                  ],
                ),
              );
            },
          ),
        )
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
