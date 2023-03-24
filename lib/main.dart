import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'ChangeNotifierProvider.dart';
import 'common/Global.dart';
import 'loginpage.dart';
import 'mainPage/homepage.dart';
import 'Registration.dart';
import 'mainPage/page4.dart';

void main() {

  Global.init().then((e) =>runApp(MyApp()));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<GlobalData>(
                create: (context) =>
                    GlobalData(
                      cutename: '',
                      elementName: '',
                      elementTime: 1,
                      elementCount: 0,
                    ),
              ),
            ],
            child: MaterialApp(
                home:
              MyHomePage(key: ValueKey("主页面"), uid: 12,username: "徐一洋",)
                //RegistretionPage(key:ValueKey('Registration'), title: '注册',)
              //LoginPage(key:ValueKey('登录'), title: '登录')
            ),
          );
        }
    );

  }
}

