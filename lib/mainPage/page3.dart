import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: ListView(children: [
          const SizedBox(height: 80),
          Container(
            width: 154,
            height: 200,
            child: getImage("assets/jutiechengjiutianshu.png"),
          ),
        ]),
      ),
    );
  }
}

Widget getImage(String imageUrl) {
  return Image.asset(imageUrl);
}
