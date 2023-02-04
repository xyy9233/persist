import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: ListView(
            children: [

              Container(
                width: 393.w,
                height: 300.h,
                alignment: Alignment.center,
                child: getImage("assets/jutie.png"),
              ),
              Container(
                width: 393.w,
                height: 300.h,
                alignment: Alignment.center,
                child: getImage("assets/zidingyi.png"),
              ),
              Container(
                width: 393.w,
                height: 300.h,
                alignment: Alignment.center,
                child: getImage("assets/pingpang.png"),
              ),
            ]
        ),
      ),
    );
  }
}

Widget getImage(String imageUrl) {
  return Image.asset(imageUrl);
}
