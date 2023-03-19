import 'package:flutter/material.dart';
import 'package:persist/mainPage/page1.dart';
import 'package:persist/mainPage/page2.dart';
import 'package:persist/mainPage/page3.dart';
import 'package:persist/mainPage/page4.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:persist/Registration.dart';
import 'package:http/http.dart' as http;
import '../change.dart';
import 'change.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.uid, required this.username}) : super(key: key);
  final int uid;
  final String username;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late final List<Widget> _pageOptions;
  @override
  void initState(){
    super.initState();
    _pageOptions=[
      Page1(key: Key("注册"), uid: widget.uid,username:widget.username),
      Page2(),
      Page3(),
      Page4(),
    ];
  }




  Future<List<dynamic>> fetchData() async {
    final response = await http.get('http://8.130.41.221:8081/habit/userAllHabit?' as Uri);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        height: 60.0.h,
        elevation: 10.0,
        shape: CircularNotchedRectangle(),
        color: Color.fromRGBO(73, 108, 251, 1),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                _selectedIndex == 0 ? 'assets/1yes.png' : 'assets/1no.png',
                height: 43.0.h,
                width: 40.0.w,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Image.asset(
                _selectedIndex == 1 ? 'assets/2yes.png' : 'assets/2no.png',
                height: 43.74.h,
                width: 40.0.w,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Image.asset(
                _selectedIndex == 2 ? 'assets/3yes.png' : 'assets/3no.png',
                height: 41.59.h,
                width: 43.0.w,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Image.asset(
                _selectedIndex == 3 ? 'assets/4yes.png' : 'assets/4no.png',
                height: 41.59.h,
                width: 43.0.w,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}







