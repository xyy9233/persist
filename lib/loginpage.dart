import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:persist/Registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mainPage/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class LoginPage extends StatefulWidget {
  LoginPage({required Key key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

            ///LoginButton
            Positioned(
              left: 36.0.w,
              top: 739.0.h,
              child: Container(
                width: 321.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: buildLoginButton(context),
              ),
            ),

            ///Forgetpassword
            Positioned(
              left: 270.0.w,
              top: 616.0.h,
              child: Container(
                width: 120.w,
                height: 40.h,
                child: buildForgetpasswordText(context),
              ),
            ),

            /// Register
            Positioned(
              left: 122.0.w,
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
            ///remember me
            Positioned(
              left: 42.0.w,
              top: 627.0.h,
              child: Text("保存密码",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color.fromRGBO(135, 135, 135, 1),
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Positioned(
              left: 6.0.w,
              top: 620.0.h,
              child: Container(
                width: 36.w,
                height: 36.h,
                child: getImage("assets/rememberok.png"),
              ),
            ),

          ],
        ));
  }

  Widget buildLoginButton(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(73, 108, 251, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            '登      录 ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {
        yinsi(context);/*login();*/
      },
    );
  }

  Widget yinsi(BuildContext context) {
    return AlertDialog(
      title: Text('隐私协议'),
      content: SingleChildScrollView(
        child: Text('参考别人的隐私协议'),
      ),
      actions: [
        TextButton(
          child: Text('我已知晓'),
          onPressed: () {
            // 点击“我已知晓”按钮后关闭弹窗
            Navigator.of(context).pop();
            login();
          },
        ),
      ],
    );
  }

  Widget buildRegisterText(context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('                 没有账号？',
              style: TextStyle(
                  color: Color.fromRGBO(109, 109, 109, 1), fontSize: 8.sp)),
          GestureDetector(
              child: Text('长按注册',
                  style: TextStyle(
                      color: Color.fromRGBO(35, 36, 79, 1), fontSize: 8.sp)),
              onLongPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistretionPage(
                        key: ValueKey('login_page'),
                        title: '注册',
                      ),
                    ));
              })
        ],
      ),
    );
  }

  Widget buildForgetpasswordText(BuildContext context) {
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
                content: Text("诶呀！只能重新注册了QAQ"),
              );
            },
          );
        },
        child: Text("忘记密码？",
            style: TextStyle(
                fontSize: 12.sp,
              color: Color.fromRGBO(135, 135, 135, 1),
              fontWeight: FontWeight.bold,)
        ),
      ),
    );
  }

  Widget buildpasswordTextField(BuildContext context) {
    return Container(
        child: TextFormField(
            obscureText: _isObscure,
            // 是否显示文字
            onSaved: (v) => password = v!,
            onChanged: (value) => password = value,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: '密码',
                hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure?Icons.visibility_off:Icons.remove_red_eye,
                    color: _eyeColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                      _eyeColor = (_isObscure
                          ? Color.fromRGBO(73, 108, 251, 1)
                          : Color.fromRGBO(73, 108, 251, 1));
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
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: '用户名',
            hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
            border: InputBorder.none,
          ),
          onChanged: (value) => username = value,
          style: TextStyle(color: Colors.white),
        ));
  }

  Widget getImage(String imageUrl) {
    return Image.asset(imageUrl);
  }

  Future<void> login() async {
    String dioUrl =
        'http://8.130.41.221:8081/users/login?username=${username}&password=${password}';
    print(dioUrl);
    Dio dio = Dio();
    var response = await dio.post(dioUrl);
    print(response.data["data"]["uid"]);
    print(response.data);
    if (response.statusCode == 200) {
      // 解析登录接口的返回数据
      //var data = json.decode(await response.stream.bytesToString());
      var data = Data.fromJson(response.data["data"]);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(key:Key("登录"),uid:response.data["data"]["uid"],username:username),
        ),
      );
    } else if(response.statusCode == 5002){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("密码错误噢"),
          );
        },
      );
    }
  }
}
