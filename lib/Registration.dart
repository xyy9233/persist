import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:persist/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'mainPage/homepage.dart';
import 'models/user.dart';

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
  String name="";
  String Email="";
  String password="";
  String Confirmpassword="";
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  Color _eyeColor1 = Color.fromRGBO(73, 108, 251, 1);
  Color _eyeColor2 = Color.fromRGBO(73, 108, 251, 1);

  get image =>getImage("assets/lookno.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          key: _formKey,
          children: [
            ///注册背景
            Positioned(
              left: 0.0.w,
              top: 0.0.h,
              child: Container(
                width: 393.w,
                height: 852.h,
                child: getImage("assets/registration.png"),
              ),
            ),

            ///标题
            Positioned(
              left: 36.0.w,
              top: 140.0.h,
              child: Container(
                  width: 241.w,
                  height: 60.h,
                  //alignment: Alignment.center,
                  child: Text(
                    "创建账号",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0,
                    ),
                  )),
            ),

            ///用户名
            Positioned(
              left: 36.0.w,
              top: 220.0.h,
              child: Container(
                  width: 88.w,
                  height: 20.h,
                  //alignment: Alignment.center,
                  child: Text(
                    "用户名",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  )),
            ),
            Positioned(
              left: 36.0.w,
              top: 244.0.h,
              child: Container(
                width: 321.w,
                height: 48.h,
                child: buildnameTextField(),
              ),
            ),

            ///邮箱
            Positioned(
              left: 36.0.w,
              top: 308.0.h,
              child: Container(
                  width: 50.w,
                  height: 20.h,
                  //alignment: Alignment.center,
                  child: Text(
                    "邮箱",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  )),
            ),
            Positioned(
              left: 36.0.w,
              top: 336.0.h,
              child: Container(
                width: 321.w,
                height: 48.h,
                child: buildEmailTextField(),
              ),
            ),

            ///密码
            Positioned(
              left: 36.0.w,
              top: 404.0.h,
              child: Container(
                  height: 20.h,
                  alignment: Alignment.center,
                  child: Text(
                    "密码",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  )),
            ),
            Positioned(
              left: 36.0.w,
              top: 428.0.h,
              child: Container(
                width: 321.w,
                height: 48.h,
                child: buildpasswordTextField(context),
              ),
            ),

            ///确认密码
            Positioned(
              left: 36.0.w,
              top: 494.0.h,
              child: Container(
                  width: 64.w,
                  height: 40.h,
                  //alignment: Alignment.center,
                  child: Text(
                    "确认密码",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  )),
            ),
            Positioned(
              left: 36.0.w,
              top: 520.0.h,
              child: Container(
                width: 321.w,
                height: 48.h,
                child: buildConfirmpasswordTextField(),
              ),
            ),

            ///按钮
            Positioned(
              left: 36.0.w,
              top: 612.0.h,
              child: Container(
                width: 321.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: buildRegistretionButton(context),
              ),
            ),

            ///登录口
            Positioned(
              left: 132.0.w,
              top: 791.0.h,
              child: Container(
                child: buildLogininText(context),
              ),
            ),
          ],
        ));
  }

  Widget buildnameTextField() {
    return Container(
        width: 45.w,
        height: 321.w,
        decoration: BoxDecoration(
          color: Color.fromRGBO(164, 182, 253, 1),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.centerLeft,
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10, bottom: 4),
            hintText: '您的用户名',
            hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: Colors.white,
          ),
          onChanged: (value) => name = value,
        )

    );

    /* Container(
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
        ));*/
  }

  Widget buildEmailTextField() {
    return Container(
      width: 45.w,
      height: 321.w,
      decoration: BoxDecoration(
        color: Color.fromRGBO(164, 182, 253, 1),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10, bottom: 4),
            hintText: '您的邮箱地址',
            hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
            border: InputBorder.none,
          ),
            validator: (v) {
              var emailReg = RegExp(
                  r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
              if (!emailReg.hasMatch(v!)) {
                return '请输入正确的邮箱地址';
              }
            },
          onChanged: (v)=> Email=v,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildpasswordTextField(BuildContext context) {
    return Container(
      width: 45.w,
      height: 321.w,
      decoration: BoxDecoration(
        color: Color.fromRGBO(164, 182, 253, 1),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          obscureText: _isObscure1,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, top: 8),
              hintText: '至少输入8位字符',
              hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure1?Icons.visibility_off:Icons.remove_red_eye,
                  color: _eyeColor1,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure1 = !_isObscure1;
                    _eyeColor1 = (_isObscure1
                        ? Color.fromRGBO(73, 108, 251, 1)
                        : Color.fromRGBO(73, 108, 251, 1)
                    );
                  });
                },
              )
          ),
          style: TextStyle(
            color: Colors.white,
          ),
          onChanged: (value)=>password=value ,
        ),
      ),
    );
  }

  Widget buildConfirmpasswordTextField() {
    return Container(
      width: 45.w,
      height: 321.w,
      decoration: BoxDecoration(
        color: Color.fromRGBO(164, 182, 253, 1),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          obscureText: _isObscure2,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, top: 8),
              hintText: '重复您的密码',
              hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure2?Icons.visibility_off:Icons.remove_red_eye,
                  color: _eyeColor2,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure2 = !_isObscure2;
                    _eyeColor2 = (_isObscure2
                        ? Color.fromRGBO(73, 108, 251, 1)
                        : Color.fromRGBO(73, 108, 251, 1)
                    );
                  });
                },
              )),
          style: TextStyle(
            color: Colors.white,
          ),
          onChanged: (value)=>Confirmpassword=value,
        ),
      ),
    );
  }

  Widget getImage(String imageUrl) {
    return Image.asset(imageUrl);
  }

  Widget ShuruContainer(String biaoti, String hint, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Text(
            biaoti,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: 45.0,
          height: 321.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(164, 182, 253, 1),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
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
            '注      册',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      onTap: () {
        print(name);
        print(Email);
        print(password);
        print(Confirmpassword);
        if(password==Confirmpassword){
          register();
        }
        else {
          showDialog(
              context: context,
              builder: (BuildContext context){
            return AlertDialog(
              content:Text("两次密码不一致喵！")
            );
          });
        }
        //registerUser();
      },
    );
  }

  Future<void> register() async {
    String dioUrl =
        'http://8.130.41.221:8081/users/reg?username=${name}&Email=${Email}&password=${password}&confirmpassword=${Confirmpassword}';
    print(dioUrl);

    Dio dio = Dio();
    var response = await dio.post(dioUrl);
    print(response);
    //print(response.data["state"]);
    print(response.data['data']["uid"]);
    var state = response.data["state"];
    print(state);
    if (state == 200) {
      // 解析登录接口的返回数据
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(key:Key("注册"),uid:response.data["data"]["uid"],username: name),
        ),
      );
      print(response.data["data"]["uid"]);
    } else if(state==4000) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("QAQ用户名已被占用了喵~"),
          );
        },
      );
    }
    else{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("账号or邮箱or密码有问题！"),
          );
        },
      );
    }
  }
  Widget buildLogininText(context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('           已有账号？',
              style: TextStyle(
                  color: Color.fromRGBO(109, 109, 109, 1), fontSize: 8.sp)),
          GestureDetector(
              child: Text('长按登录',
                  style: TextStyle(
                      color: Color.fromRGBO(35, 36, 79, 1), fontSize: 8.sp)),
              onLongPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage(
                              key: ValueKey('login_page'),
                              title: '登录',
                            )));
              })
        ],
      ),
    );
  }

/* child: TextFormField(
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
                          : Theme
                          .of(context)
                          .iconTheme
                          .color)!;
                      print(_eyeColor);
                      print("2222");
                    });
                  },
                ))));*/
}
