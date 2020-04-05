import 'package:flutter/material.dart';

class TreeItem extends StatelessWidget {

  final String title;
  final String subtitle;
  final String imageUrl;
  final GestureTapCallback onTap;

  TreeItem({this.title, this.subtitle, this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

}