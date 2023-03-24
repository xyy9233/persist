import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page2 extends StatelessWidget {
  Page2({required Key key,required this.uid}):super(key:key);
  final int uid;

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
          child: Stack(
          children: [
      Positioned(
        left: 16.w,
        top: 50.0.h,
        child: Container(
          width: 361.w,
          height: 255.h,
          child: getImage("assets/pingpangchengjiu.png"),
        ),
      ),
            Positioned(
              left: 16.0.w,
              top: 300.0.h,
              child: Container(
                width: 361.w,
                height: 260.h,
                child: getImage(
                    "assets/jutiechengjiu.png"
                ),
              ),
            ),
            Positioned(
              left: 16.0.w,
              top: 554.0.h,
              child: Container(
                width: 361.w,
                height: 253.h,
                child: getImage(
                  "assets/zidingyichengjiu.png"
                ),
              ),
            ),
            Positioned(
              left: 16.0.w,
              top: 554.0.h,
              child: Container(
                width: 361.w,
                height: 253.h,
                child: getImage(
                    "assets/zidingyichengjiu.png"
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
  return Image.asset(imageUrl,fit: BoxFit.cover,);
}
