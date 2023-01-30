import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:persist/Registration.dart';
import 'package:http/http.dart' as http;
import 'mainPage/homepage.dart';
import 'package:provider/provider.dart';

///数据持久化：
/*
class User {
  final String name;
  final String password;
  User({required this.name, required this.password});
}

saveUserProfile(User user) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('name', user.name);
  prefs.setString('password', user.password);
}

Future<User> getUserProfile() async {
  final prefs = await SharedPreferences.getInstance();
  final name = prefs.getString('name');
  final password = prefs.getString('password');
  return User(name: name!, password: password!);
}
*/

///

class LoginPage extends StatefulWidget {
  LoginPage({required Key key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "test";
  String _password = "123";
  bool _isObscure = true;
  Color _eyeColor = Color.fromRGBO(73, 108, 251, 1);

  @override
  Widget build(BuildContext context) {
    //final data = context.watch<GlobalData>();
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
          //const SizedBox(height: 40),
          //buildRegisterText(context), // 注册
          buildRegisterText(context),
          buildLoginButton(context), // 登录按钮
        ],
      ),
    );
  }

  /*
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = Global.profile.lastLogin ?? "";
    if (_unameController.text.isNotEmpty) {
      _nameAutoFocus = false;
    }
    super.initState();
  }
*/
  Widget buildLoginButton(BuildContext context) {
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
            'Log in',
          ),
          onPressed: () async {
            String url = "http://8.130.41.221:8081";
            var uri = Uri.parse(url);
            var response = await http.post(
              uri,
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({'name': _name, 'password': _password}),
            );
            if (response.statusCode == 200) {
              // successfully logged in
              print(
                  'Successfully logged in with name: $_name and password: $_password');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(token: "login-page"),
                ),
              );
            } else {
              // failed to log in
              print(
                  'Failed to log in with name: $_name and password: $_password');
            }
          }),
    );
  }


  Widget buildRegisterText(context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(11, 0, 11, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('没有账号?'),
            GestureDetector(
                child: const Text(
                    '长按注册', style: TextStyle(color: Colors.blueAccent)),
                onLongPress: () {
                  print("点击注册");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationPage(title: "注册")),
                  );
                }
            )
          ],
        ),
      ),
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
            onSaved: (v) => _password = v!,
            validator: (v) {
              if (v!.isEmpty) {
                return '请输入密码';
              }
              return '123';
            },
            onChanged: (value) => _password = value,
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
                    }
                    );
                  },
                )
            )
        )
    );
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
            contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          ),
          validator: (v) {
            var nameReg = RegExp(r"^[a-zA-Z0-9]+$");
            if (!nameReg.hasMatch(v!)) {
              return '只能输入字母和数字';
            }
            return "test";
          },
          onChanged: (value) => _name = value,
        )
    );
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

/*
  _submitForm() async {
    print(_name);
    print(_password);
    if (_name.isEmpty) {
      print("请输入用户名");
      return;
    }
    if (_password.isEmpty) {
      print("请输入密码");
      return;
    }
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_name);
      print(_password);
      print('Sending request with name: $_name and password: $_password');
      final response = await http.post(
        'http://8.130.41.221:8081' as Uri,
        body: {'name': _name, 'password': _password},
      );
      print(response.statusCode);
      final responseJson = json.decode(response.body);
      if (responseJson['status'] == 'success') {
        final token = responseJson['token'];
        print('服务器响应: ${response.statusCode}');
        print("!!!!!!!!!!!!!!!!!!!!!!!!");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(token: token),
          ),
        );
      } else {
        print("戳啦!!!");
      }
    }
    else{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Color.fromRGBO(164, 182, 253, 1),
            content: Text("诶嗯！输入非法！！！"),
          );
        },
      );
    }
  }
}
*/
}