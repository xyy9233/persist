import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/user.dart';

String name1 = "徐一洋";
String email1 = "3022244182@tju.edu.cn";
String motto1 = "总有地上的生灵,敢于直面雷霆的威光";
String avatar1 = " ";

class Page4 extends StatelessWidget {
  Page4({required Key key, required this.uid}) : super(key: key);
  final int uid;

  Future<void> shezhi() async {
    String dioUrl = 'http://8.130.41.221:8081/users/get_by_uid?uid=${uid}';
    print(dioUrl);
    print(uid);
    Dio dio = Dio();
    var response = await dio.get(dioUrl);
    print(response);
    print(response.data);
    var name = Data.fromJson(response.data["data"]['username']);
    name1 = name as String;
    //var motto=Data.fromJson(response.data["data"]['motto']);motto1=motto as String;
    var email = Data.fromJson(response.data["data"]['email']);
    email1 = email as String;
    var avatar = Data.fromJson(response.data["data"]['avatar']);
    avatar1 = avatar as String;
    print("smsmssssmssmssmsmsm");
    //print(motto1);
    print(name1);
    print(email);
    print(avatar);
  }

  @override
  Widget build(BuildContext context) {
    shezhi();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/page4.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
                left: 95.w,
                top: 120.0.h,
                child: Container(
                  width: 203.w,
                  height: 187.19.h,
                  child: getImage("assets/avatarsample.png"),
                )),
            Positioned(
              left: 0.w,
              top: 320.h,
              child: Container(
                  width: 393.w,
                  height: 80.h,
                  child: Text("${name1}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 48,
                      ))),
            ),
            Positioned(
              left: 48.w,
              top: 560.h,
              child: Container(
                width: 345.w,
                height: 20.h,
                child: Text(
                  "你们怎么知道我抽到了申鹤",
                ),
              ),
            ),
            Positioned(
              left: 48.w,
              top: 670.h,
              child: Container(
                width: 393.w,
                height: 20.h,
                child: Text("${email1}"),
              ),
            ),
            Positioned(
              left: 264.w,
              top: 25.h,
              child: Container(
                width: 160.w,
                height: 40.h,
                child: editziliao(context)
              ),
            ),

          ],
        ),
      ),
    );
  }



  Widget editziliao(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Color.fromRGBO(164, 182, 253, 1),
                content: Text("别急别急别急在开发啦！！！"),
              );
            },
          );
        },
        child: Text(" "),
      ),
    );
  }

  Widget getImage(String imageUrl) {
    return Image.asset(imageUrl);
  }

  void setState(Null Function() param0) {}
}
