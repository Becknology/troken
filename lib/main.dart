import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troken/model/TokenModel.dart';
import 'package:troken/network/TokenApi.dart';

import 'LoginPage.dart';

void main() => runApp(MyApp());

const mainColor = Color(0xFFAED581);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<TokenModel>(
      create: (c) => TokenModel(TokenApi()),
      child: MaterialApp(
        title: 'Troken',
        theme: ThemeData(
          primaryColor: mainColor,
          accentColor: mainColor,
          buttonColor: mainColor,
        ),
        home: LoginPage(),
      ),
    );
  }
}