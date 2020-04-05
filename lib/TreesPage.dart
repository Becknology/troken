

import 'package:flutter/material.dart';
import 'package:troken/LCEFutureBuilder.dart';

class TreesPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TreesPageState();

}

class _TreesPageState extends State<TreesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Trees"),
      ),
      body: LCEFutureBuilder(
        builder: (context, snapshot) {

        }
      ),
    );
  }

}