import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page3 extends StatelessWidget {
  Page3({required Key key,required this.uid}):super(key:key);
  final int uid;

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
        child: Stack(
          children: [
            Positioned(
              left: 28.0.w,
              top: 142.0.h,
              child: Container(
                width: 154.w,
                height: 200.h,
                child: getImage("assets/chengjiu1.png"),
              ),
            ),
            Positioned(
              left: 211.0.w,
              top: 142.0.h,
              child: Container(
                width: 154.w,
                height: 200.h,
                child: getImage(
                    "assets/chengjiu2.png"
                ),
              ),
            ),
            Positioned(
              left: 28.0.w,
              top: 366.0.h,
              child: Container(
                width: 154.w,
                height: 200.h,
                child: getImage(
                    "assets/chengjiu3.png"
                ),
              ),
            ),
            Positioned(
              left: 211.0.w,
              top: 366.0.h,
              child: Container(
                width: 154.w,
                height: 200.h,
                child: getImage(
                    "assets/chengjiu4.png"
                ),
              ),
            ),
            Positioned(
              left: 28.0.w,
              top: 590.0.h,
              child: Container(
                width: 154.w,
                height: 200.h,
                child: getImage(
                    "assets/dengdeng.png"
                ),
              ),
            ),
            Positioned(
              left: 211.0.w,
              top: 590.0.h,
              child: Container(
                width: 154.w,
                height: 200.h,
                child: getImage(
                    "assets/dengdeng.png"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getImage(String imageUrl) {
  return Image.asset(imageUrl);
}
