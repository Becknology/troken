import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troken/TokenModel.dart';
import 'package:troken/network/TokenApi.dart';

import 'LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<TokenModel>(
      create: (c) => TokenModel(TokenApi()),
      child: MaterialApp(
        title: 'Troken',
        theme: ThemeData(
          primaryColor: Color(0xFFAED581),
          accentColor: Color(0xFFAED581),
          buttonColor: Color(0xFFAED581),
        ),
        home: LoginPage(),
      ),
    );
  }
}