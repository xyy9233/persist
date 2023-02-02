import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/page3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(

        ),
      ),
    );
  }
}