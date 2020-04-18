import 'package:flutter/material.dart';
import 'package:troken/main.dart';

class TreeItem extends StatelessWidget {

  final bool isSelected;
  final String title;
  final String subtitle;
  final String imageUrl;
  final GestureTapCallback onTap;
  final GestureTapCallback onTapImage;
  final GestureTapCallback onTapHistory;
  final GestureTapCallback onTapMap;

  TreeItem({this.title, this.subtitle, this.imageUrl, this.onTap, this.onTapImage, this.onTapHistory, this.onTapMap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? Colors.grey[300] : Colors.white12,
      child: ListTile(
        leading: GestureDetector(
          onTap: onTapImage,
          child: Hero(
            tag: imageUrl,
            child: Image.network(imageUrl)
          )
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.history),
              ),
              onTap: onTapHistory,
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.map),
              ),
              onTap: onTapMap,
            )
          ],
        ),
      ),
    );
  }

}