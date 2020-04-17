import 'package:flutter/material.dart';
import 'package:troken/main.dart';

class TreeItem extends StatelessWidget {

  final bool isSelected;
  final String title;
  final String subtitle;
  final String imageUrl;
  final GestureTapCallback onTap;

  TreeItem({this.title, this.subtitle, this.imageUrl, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? Colors.grey[300] : Colors.white12,
      child: ListTile(
        leading: Image.network(imageUrl),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }

}