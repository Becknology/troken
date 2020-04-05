import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troken/TokenModel.dart';
import 'package:troken/main.dart';
import 'package:troken/network/Requests.dart';
import 'package:troken/network/TokenApi.dart';

import 'homepage/HomePage.dart';

class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }

}

class _LoginPageState extends State<LoginPage> {

  final _usernameTextController = TextEditingController(text: "JonathanMuller");
  final _passwordTextController = TextEditingController(text: "Muller2020");

  final FocusNode _buttonFocus = new FocusNode();
  final FocusNode _passwordFocus = new FocusNode();

  final snackBar = SnackBar(content: Text("Something went wrong. Please try again."));

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Troken"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                cursorColor: mainColor,
                controller: _usernameTextController,
                decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder()
                ),
                textInputAction: TextInputAction.next,
                onSubmitted: (s) {
                  _passwordFocus.requestFocus();
                },
              ),
              SizedBox(height: 12,),
              TextField(
                cursorColor: mainColor,
                focusNode: _passwordFocus,
                controller: _passwordTextController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: Icon(_obscureText ? Icons.lock_outline : Icons.lock_open),
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  hintText: "Password",
                  border: OutlineInputBorder()
                ),
                obscureText: _obscureText,
                textInputAction: TextInputAction.done,
                onSubmitted: (s) async {
                  _buttonFocus.requestFocus();
                  onLogin();
                },
              ),
              SizedBox(height: 12,),
              RaisedButton(
                focusNode: _buttonFocus,
                child: Text("Login"),
                onPressed: () async {
                  onLogin();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLogin() async {
    var isSuccess = await Provider.of<TokenModel>(context)
        .login(_usernameTextController.text, _passwordTextController.text);
    if (isSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print("Bad");
    }
  }

  @override
  void dispose() {
    _passwordTextController.dispose();
    _usernameTextController.dispose();
    _passwordFocus.dispose();
    _buttonFocus.dispose();
    super.dispose();
  }

}