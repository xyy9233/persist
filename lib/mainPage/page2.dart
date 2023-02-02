import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/page2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(

        ),
      ),
    );
  }
}

