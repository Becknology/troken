import 'package:flutter/material.dart';
import 'package:troken/utils/DateFormats.dart';

class TreeLogItem extends StatelessWidget {

  final String from;
  final String to;
  final String date;

  TreeLogItem({this.from, this.to, this.date});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("$from -> $to"),
      subtitle: Text(formatter.format(DateTime.parse(date))),
    );
  }

}