import 'package:flutter/material.dart';

class TreeItem extends StatelessWidget {

  final String title;
  final String subtitle;
  final String imageUrl;

  TreeItem({this.title, this.subtitle, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

}