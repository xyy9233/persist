import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:persist/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'mainPage/homepage.dart';


///数据持久化：
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

///

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";
  bool _isObscure = true;
  Color _eyeColor = Colors.white;

/*  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final response = await http.post(
        'http://8.130.41.221:8081/web/register.html' as Uri,
        body: {'name': _name, 'password': _password},
      );
      final responseJson = json.decode(response.body);
      if (responseJson['status'] == 'success') {
        final token = responseJson['token'];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(token: token),
          ),
        );
      } else {
        // Show error message
        print("戳啦!!!");
      }
    }
  }*/

  Future _submitForm() async {
    var dio = Dio();
    var response = await dio.post(
        "http://8.130.41.221:8081/web/register.html",
        data: {"username": username,
          "password": password}
    );
    if (username.isEmpty) {
      print("请输入用户名");
      return;
    }
    if (password.isEmpty) {
      print("请输入密码");
      return;
    }
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(token: "w"),
        ),
      );
    } else {
      print(response.data);
    }
  }


  @override
  Widget build(BuildContext context) {
    //ScreenHelper.int(context);
    return Scaffold(
      key: _formKey,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        children: [
          getImage("assets/loginback.png"),
          const SizedBox(height: 10),
          Container(
            width: 250,
            height: 80,
            alignment: Alignment.center,
            child: getImage("assets/biaoti.png"),
          ),
          Container(
            width: 30,
            height: 15,
            alignment: Alignment.center,
            child: getImage("assets/fubiaoti.png"),
          ),
          Container(
            width: 30,
            height: 29,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 1, right: 10, bottom: 0),
            child: getImage("assets/huahua.png"),
          ),
          const SizedBox(height: 10),
          buildnameTextField(), // 输入账号
          const SizedBox(height: 20),
          buildpasswordTextField(context), // 输入密码
          buildForgetpasswordText(context), // 忘记密码
          //const SizedBox(height: 20),
          Container(
            width: 88,
            height: 77,
            alignment: Alignment.centerLeft,
            child: getImage("assets/dahua.png"),
          ),
          buildRegisterText(context),
          buildRegistrationButton(context), // 注册按钮
        ],
      ),
    );
  }

  @override
/*
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = Global.profile.lastRegistration ?? "";
    if (_unameController.text.isNotEmpty) {
      _nameAutoFocus = false;
    }
    super.initState();
  }
*/

  Widget buildRegisterText(context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(11, 0, 11, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('已有账号?'),
            GestureDetector(
              child: const Text(
                  '长按登录', style: TextStyle(color: Colors.blueAccent)),
              onLongPress: () {
                print("登录");
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        LoginPage(title: "登录", key: UniqueKey(),))
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildRegistrationButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 5, 25, 20),
      width: 321,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      //padding: EdgeInsets.fromLTRB(36, 0, 36, 42),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(Color.fromRGBO(73, 108, 251, 1)),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
          ),
          child: Text(
            'Registration',
          ),
          onPressed: () {
            registerUser();
          }),
    );
  }

  Widget buildForgetpasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1, right: 30, bottom: 0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            //Navigator.pop(context);
            print("Forget password");
          },
          child: const Text("Forget password?",
              style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(207, 207, 207, 1))),
        ),
      ),
    );
  }

  Widget buildpasswordTextField(BuildContext context) {
    return Container(
        height: 45,
        width: 321,
        margin: EdgeInsets.only(left: 33, top: 0, right: 33),
        decoration: BoxDecoration(
          color: Color.fromRGBO(164, 182, 253, 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: TextFormField(
            obscureText: _isObscure,
            // 是否显示文字
            onSaved: (v) => password = v!,
            validator: (v) {
              if (v!.isEmpty) {
                return '请输入密码';
              }
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                labelText: "password",
                contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: _eyeColor,
                  ),
                  onPressed: () {
                    // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                    setState(() {
                      _isObscure = !_isObscure;
                      _eyeColor = (_isObscure
                          ? Color.fromRGBO(73, 108, 251, 1)
                          : Theme
                          .of(context)
                          .iconTheme
                          .color)!;
                    });
                  },
                ))));
  }

  Widget buildnameTextField() {
    return Container(
        height: 45,
        width: 321,
        margin: EdgeInsets.only(left: 33, top: 0, right: 33),
        decoration: BoxDecoration(
          color: Color.fromRGBO(164, 182, 253, 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Username',
            contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 10),
          ),
          validator: (v) {
            var nameReg = RegExp(r"^[a-zA-Z0-9]+$");
            if (!nameReg.hasMatch(v!)) {
              return '只能输入字母和数字';
            }
          },
          onSaved: (v) => username = v!,
        ));
  }

  Widget buildTitle() {
    return const Padding(
        padding: EdgeInsets.fromLTRB(57, 340, 60, 0),
        child: Center(
            child: Text(
              'Persist',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 47,
              ),
            )));
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
