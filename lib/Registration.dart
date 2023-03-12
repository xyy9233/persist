import 'package:flutter/material.dart';
import 'package:persist/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  TextEditingController name =TextEditingController();
  TextEditingController Email =TextEditingController();
  TextEditingController password =TextEditingController();
  TextEditingController Confirmpassword =TextEditingController();
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  Color _eyeColor = Color.fromRGBO(73, 108, 251, 1);

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
              top: 156.0.h,
              child: Container(
                  width: 241.w,
                  height: 40.h,
                  alignment: Alignment.center,
                  child: Text(
                    "Create account",
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
                  alignment: Alignment.center,
                  child: Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 16.0,
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
              top: 312.0.h,
              child: Container(
                  width: 50.w,
                  height: 20.h,
                  alignment: Alignment.center,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 16.0,
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
                    "Password",
                    style: TextStyle(
                      fontSize: 16.0,
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
              left: 37.0.w,
              top: 496.0.h,
              child: Container(
                  width: 138.w,
                  height: 20.h,
                  alignment: Alignment.center,
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontSize: 16.0,
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
        child: TextFormField(
          controller: name,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10, bottom: 4),
            hintText: 'Your username',
            hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: Colors.white,
          ),
          validator: (v) {
            return v!.trim().isNotEmpty ? null : "用户名不能为空";
          },

        ));

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
          controller: Email,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10, bottom: 4),
            hintText: 'Your email address',
            hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
            border: InputBorder.none,
          ),
          validator: (v) {
            return v!.trim().length > 5 ? null : "密码不能少于6位";
          },
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
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, top: 8),
              hintText: 'Must be more than 8 characters',
              hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: _eyeColor,
                ),
                onPressed: () {
                  print("1111");
                  setState(() {
                    _isObscure1 = !_isObscure1;
                    print(_isObscure1);

                    _eyeColor = (_isObscure1
                        ? Color.fromRGBO(73, 108, 251, 1)
                        : Theme.of(context).iconTheme.color)!;
                    print(_eyeColor);
                    print("2222");
                  });
                },
              )),
          style: TextStyle(
            color: Colors.white,
          ),
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
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, top: 8),
              hintText: 'Repeat password',
              hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: _eyeColor,
                ),
                onPressed: () {
                  // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                  setState(() {
                    _isObscure2 = !_isObscure2;
                    print(_isObscure2);
                    print("1111");
                    _eyeColor = (_isObscure2
                        ? Color.fromRGBO(73, 108, 251, 1)
                        : Theme.of(context).iconTheme.color)!;
                    print(_eyeColor);
                    print("2222");
                  });
                },
              )),
          style: TextStyle(
            color: Colors.white,
          ),
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
            'Registretion',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {
        //registerUser();
      },
    );
  }

  Widget buildLogininText(context) {
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
