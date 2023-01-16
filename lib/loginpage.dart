import 'package:flutter/material.dart';
import 'homepage.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _name, _password;
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/login.jpg")),
          ),
          child: Form(
            key: _formKey, // 设置globalKey，用于后面获取FormStat
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
                buildTitle(), // Welcome back
                buildSubTitle(), // Wb下面副标题
                const SizedBox(height: 60),
                buildnameTextField(), // 输入账号
                const SizedBox(height: 30),
                buildpasswordTextField(context), // 输入密码
                buildForgetpasswordText(context), // 忘记密码
                const SizedBox(height: 40),
                // const SizedBox(height: 60),
                buildRegisterText(context), // 注册
                buildLoginButton(context), // 登录按钮
              ],
            ),
          ),
        ));
  }

  @override
/*  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = Global.profile.lastLogin ?? "";
    if (_unameController.text.isNotEmpty) {
      _nameAutoFocus = false;
    }
    super.initState();
  }*/

  Widget buildRegisterText(context) {
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
  }

/*
  Widget buildOtherMethod(context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: _loginMethod
          .map((item) => Builder(builder: (context) {
        return IconButton(
            icon: Icon(item['icon'],
                color: Theme.of(context).iconTheme.color),
            onPressed: () {
              /*//tod噢？ 第三方登录方法*/
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('${item['title']}登录'),
                    action: SnackBarAction(
                      label: '取消',
                      onPressed: () {},
                    )),
              );
            });
      }))
          .toList(),
    );
  }
*/

  Widget buildLoginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SizedBox(
        height: 45,
        width: 400,
        child: ElevatedButton(
          style: ButtonStyle(
            // 设置圆角
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child: Text('Login',
              style: Theme.of(context).primaryTextTheme.headline5),
          onPressed: () {
            // 表单校验通过才会继续执行
            if ((_formKey.currentState as FormState).validate()) {
              (_formKey.currentState as FormState).save();
              //TOD0 执行登录方法
              print('user_name: $_name, user_password: $_password');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyHomePage();
              }));
            }
            ;
          },
        ),
      ),
    );
  }

  Widget buildForgetpasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            //Navigator.pop(context);
            print("Forget user_password");
          },
          child: const Text("Forget user_password?",
              style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(20, 30, 70, 40))),
        ),
      ),
    );
  }

  Widget buildpasswordTextField(BuildContext context) {
    return TextFormField(
        obscureText: _isObscure, // 是否显示文字
        onSaved: (v) => _password = v!,
        validator: (v) {
          if (v!.isEmpty) {
            return '请输入密码';
          }
        },
        decoration: InputDecoration(
            labelText: "password",
            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
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
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color)!;
                });
              },
            )));
  }

  Widget buildnameTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Username',
          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
      validator: (v) {
        var nameReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!nameReg.hasMatch(v!)) {
          return '太长啦！！！';
        }
      },
      onSaved: (v) => _name = v!,
    );
  }

  Widget buildSubTitle() {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Center(
          child: Text('togin   to   your   account   ',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 21,
              )),
        ));
  }

  Widget buildTitle() {
    return const Padding(
        padding: EdgeInsets.fromLTRB(0, 330, 10, 0),
        child: Center(
            child: Text(
              'Welcome back',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 47,
              ),
            )));
  }
}