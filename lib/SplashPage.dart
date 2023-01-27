import 'dart:async';
import 'package:flutter/material.dart';
import 'package:persist/loginpage.dart';
import 'package:flutter/cupertino.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _opacity = 1;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 0), () {
      setState(() {
        _opacity=0;
      });
      Timer(Duration(milliseconds: 0),(){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(title: "登录")));
      }
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 0),
        child: Image.asset('assets/loginback.png'),
      ),
    );
  }

}


