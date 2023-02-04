import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:persist/Registration.dart';
import 'package:http/http.dart' as http;
import 'package:persist/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mainPage/homepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class User {
  final String username;
  final String password;
  User({required this.username, required this.password});
}

saveUserProfile(User user) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('username', user.username);
  prefs.setString('password', user.password);
}

Future<User> getUserProfile() async {
  final prefs = await SharedPreferences.getInstance();
  final username = prefs.getString('username');
  final password = prefs.getString('password');
  return User(username: username!, password: password!);
}

class RegistretionPage extends StatefulWidget {
  RegistretionPage({required Key key, required this.title}) : super(key: key);
  final String title;

  @override
  _RegistretionPageState createState() => _RegistretionPageState();
}

class _RegistretionPageState extends State<RegistretionPage> {
  final _formKey = GlobalKey<FormState>();
  String username = "test";
  String password = "123";
  bool _isObscure = true;
  Color _eyeColor = Color.fromRGBO(73, 108, 251, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          key: _formKey,
          children: [
            Positioned(
              left: 0.0.w,
              top: 0.0.h,
              child: Container(
                width: 393.w,
                height: 390.h,
                child: getImage("assets/loginback.png"),
              ),
            ),
            Positioned(
              left: 57.0.w,
              top: 353.0.h,
              child: Container(
                width: 276.w,
                height: 80.h,
                alignment: Alignment.center,
                child: getImage("assets/biaoti.png"),
              ),
            ),
            Positioned(
              left: 36.0.w,
              top: 432.0.h,
              child: Container(
                width: 357.w,
                height: 179.h,
                child: getImage("assets/zhanghaomimakuang.png"),
              ),
            ),
            ///RegistretionButton
            Positioned(
              left: 36.0.w,
              top: 739.0.h,
              child: Container(
                width: 321.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: buildRegistretionButton(context),
              ),
            ),
            ///Registretion
            Positioned(
              left: 132.0.w,
              top: 791.0.h,
              child: Container(
                child: buildRegisterText(context),
              ),
            ),
            ///账号
            Positioned(
              left: 36.0.w,
              top: 492.0.h,
              child: Container(
                width: 321.w,
                height: 48.h,
                child: buildnameTextField(),
              ),
            ),
            ///密码
            Positioned(
              left: 60.0.w,
              top: 560.0.h,
              child: Container(
                width: 300.w,
                height: 48.h,
                child: buildpasswordTextField(context),
              ),
            ),
            /*///remember me
            Positioned(
              left: 42.0.w,
              top: 627.0.h,
              child: Text(
                  "Remember  me",
                  style: TextStyle(
                    color: Color.fromRGBO(135, 135, 135, 1),
                    //fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Positioned(
              left: 6.0.w,
              top: 620.0.h,
              child: Container(
                width: 36.w,
                height: 36.h,
                child: getImage("assets/rememberok.png"),
              ),
            ),*/
          ],
        ));
  }

  Widget buildRegistretionButton(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(73, 108, 251, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Registretion',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {
        registerUser();
      },
    );


  }

  Widget buildRegisterText(context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account?',
              style: TextStyle(
                  color: Color.fromRGBO(109, 109, 109, 1), fontSize: 8.sp)),
          GestureDetector(
              child: Text('Sign in.',
                  style: TextStyle(
                      color: Color.fromRGBO(35, 36, 79, 1), fontSize: 8.sp)),
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(key: ValueKey('login_page'), title: '登录',))
                );
              })
        ],
      ),
    );
  }


  Widget buildpasswordTextField(BuildContext context) {
    return Container(
        child: TextFormField(
            obscureText: _isObscure,
            // 是否显示文字
            onSaved: (v) => password = v!,
            validator: (v) {
              if (v!.isEmpty) {
                return '请输入密码';
              }
              return '123';
            },
            onChanged: (value) => password = value,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp
                ),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: _eyeColor,
                  ),
                  onPressed: () {
                    // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                    setState(() {
                      _isObscure = !_isObscure;
                      print(_isObscure);
                      print("1111");
                      _eyeColor = (_isObscure
                          ? Color.fromRGBO(73, 108, 251, 1)
                          : Theme.of(context).iconTheme.color)!;
                      print(_eyeColor);
                      print("2222");
                    });
                  },
                ))));
  }

  Widget buildnameTextField() {
    return Container(
        height: 45.h,
        width: 321.w,
        margin: EdgeInsets.only(left: 25.w, top: 0.h, right: 33.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Username',
            hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 16.sp
            ),
            border: InputBorder.none,

          ),
          validator: (v) {
            var nameReg = RegExp(r"^[a-zA-Z0-9]+$");
            if (!nameReg.hasMatch(v!)) {
              return '只能输入字母和数字';
            }
            return "test";
          },
          onChanged: (value) => username = value,
          style: TextStyle(color: Colors.white),
        ));
  }

  Widget getImage(String imageUrl) {
    return Image.asset(imageUrl);
  }


  Future<void> registerUser() async {
    var url = Uri.parse('http://8.130.41.221:8080/users/reg');
    var body = {'username': username, 'password': password};
    http.get(url, headers: body).then((response) {
      print('服务器响应: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Successful registration');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(token: "login-page"),
          ),
        );
      }
      else {
        print('Failed to register user');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(content: Text("注册失败，要不再试试？"),);
          },
        );
      }
    }
    );
  }
}
