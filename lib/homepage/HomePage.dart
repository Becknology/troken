import 'package:flutter/material.dart';
import 'package:troken/network/Requests.dart';
import 'package:troken/network/TokenApi.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {

  String token = "No Token";

  final _walletTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final FocusNode _buttonFocus = new FocusNode();
  final FocusNode _passwordFocus = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _walletTextController,
                decoration: InputDecoration(
                  hintText: "Wallet Name",
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
                  var request = AuthRequest(_walletTextController.text, _passwordTextController.text);
                  var response = await TokenApi().authenticate(request);
                },
              ),
              SizedBox(height: 12,),
              RaisedButton(
                focusNode: _buttonFocus,
                child: Text("Login"),
                onPressed: () async {
                  var request = AuthRequest(_walletTextController.text, _passwordTextController.text);
                  var response = await TokenApi().authenticate(request);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}