import 'package:flutter/material.dart';
import 'Screenhelper.dart';
import 'homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

///数据持久化：
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

///

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final GlobalKey _formKey = GlobalKey<FormState>();
  late String _name, _password;
  bool _isObscure = true;
  Color _eyeColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    //ScreenHelper.int(context);
    return Scaffold(
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
            padding: const EdgeInsets.only(top: 1,right: 10,bottom: 0),
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
          buildLoginButton(context), // 登录按钮
        ],
      ),
    );
  }

  @override
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

/*  Widget buildRegisterText(context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(11, 0, 11, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('没有账号?'),
            GestureDetector(
              child: const Text('点击注册', style: TextStyle(color: Colors.green)),
              onTap: () {
                print("点击注册");
              },
            )
          ],
        ),
      ),
    );
  }*/

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
            backgroundColor: MaterialStateProperty.all(Color.fromRGBO(73,108,251,1)),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
          ),
          child: Text(
              'Log in',

          ),
          onPressed: ()
          /*{
            // 表单校验通过才会继续执行
            if ((_formKey.currentState as FormState).validate()) {
              (_formKey.currentState as FormState).save();
              //TOD0 执行登录方法
              print('user_name: $_name, user_password: $_password');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyHomePage();
              }));
            }
          },*/
        {
        Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new MyHomePage()),
        );
        }
        ),
      );
  }

  Widget buildForgetpasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1,right: 30,bottom: 0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            //Navigator.pop(context);
            print("Forget password");
          },
          child: const Text("Forget password?",
              style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(207,207,207,1))),
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
        obscureText: _isObscure, // 是否显示文字
        onSaved: (v) => _password = v!,
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
                      : Theme.of(context).iconTheme.color)!;
                });
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

              contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 10),
          ),
          validator: (v) {
            var nameReg = RegExp(r"^[a-zA-Z0-9]+$");
            if (!nameReg.hasMatch(v!)) {
              return '只能输入字母和数字';
            }
          },
          onSaved: (v) => _name = v!,
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
}
