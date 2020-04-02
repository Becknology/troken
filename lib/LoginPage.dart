import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troken/TokenModel.dart';
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

  final _usernameTextController = TextEditingController(text: "ZavenDemo");
  final _passwordTextController = TextEditingController(text: "MyGreat38473");

  final FocusNode _buttonFocus = new FocusNode();
  final FocusNode _passwordFocus = new FocusNode();

  final snackBar = SnackBar(content: Text("Something went wrong. Please try again."));

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
                focusNode: _passwordFocus,
                controller: _passwordTextController,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder()
                ),
                textInputAction: TextInputAction.done,
                onSubmitted: (s) async {
                  _buttonFocus.requestFocus();

                },
              ),
              SizedBox(height: 12,),
              RaisedButton(
                focusNode: _buttonFocus,
                child: Text("Login"),
                onPressed: () async {
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
                },
              ),
            ],
          ),
        ),
      ),
    );
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