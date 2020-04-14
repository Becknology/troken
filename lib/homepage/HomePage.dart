import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troken/TokenModel.dart';
import 'package:troken/TreesPage.dart';
import 'package:troken/network/Responses.dart';

import '../AccountPage.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          AccountPage(),
          //TreesPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Account"),
            icon: Icon(Icons.account_balance_wallet)
          ),
          BottomNavigationBarItem(
              title: Text("Send"),
              icon: Icon(Icons.monetization_on)
          )
        ]
      ),
    );
  }

}