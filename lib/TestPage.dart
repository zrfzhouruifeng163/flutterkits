import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TestPage> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  TapGestureRecognizer _privatePreRecognizer;
  TapGestureRecognizer _privatesufixRecognizer;
  bool privateSelected = true;

  @override
  void initState() {
    super.initState();
    _privatePreRecognizer = TapGestureRecognizer()
      ..onTap = () {
        this.setState(() {
          privateSelected = !privateSelected;
        });
      };
    _privatesufixRecognizer = TapGestureRecognizer()
      ..onTap = () {

      };
  }

  @override
  void dispose() {
    _privatePreRecognizer.dispose();
    _privatesufixRecognizer.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey, //设置globalKey，用于后面获取FormState
        autovalidate: true, //开启自动校验
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                margin: EdgeInsets.only(top: 20),
                child: TextFormField(
                    autofocus: true,
                    controller: _unameController,
                    decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户手机号码",
                      icon: Icon(Icons.person),
                    ),
                    // 校验用户名
                    validator: (v) {
                      return v.trim().length > 0 ? null : "用户名不能为空";
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                margin: EdgeInsets.only(top: 10),
                child: TextFormField(
                    controller: _pwdController,
                    decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        icon: Icon(Icons.lock)),
                    obscureText: true,
                    //校验密码
                    validator: (v) {
                      return v.trim().length > 5 ? null : "密码不能少于6位";
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: RaisedButton(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "登 录",
                            style: TextStyle(fontSize: 18),
                          ),
                          textColor: Colors.white,
                          onPressed: () {
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                            }
                          },
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        privateSelected
                            ? "images/icon_login_private_selected.png"
                            : "images/icon_login_private_unselected.png",
                        width: 15,
                        height: 15,
                      ),
                      onTap: () {
                        this.setState(() {
                          privateSelected = !privateSelected;
                        });
                      },
                    ),
                    Container(
                      width: 7,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "登录即代表您已同意",
                        recognizer: _privatePreRecognizer,
                      ),
                      TextSpan(
                        text: "《广联达信息保护及隐私政策》",
                        recognizer: _privatesufixRecognizer,
                      ),
                    ]))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
