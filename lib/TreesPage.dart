

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troken/HistoryPage.dart';
import 'package:troken/LCEFutureBuilder.dart';
import 'package:troken/TokenModel.dart';
import 'package:troken/TreeItem.dart';
import 'package:troken/network/Responses.dart';

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
      body: LCEFutureBuilder<TreeListResponse>(
        future: Provider.of<TokenModel>(context).loadTrees(),
        builder: (context, snapshot) {
          var trees = snapshot.data.trees;
          return ListView.builder(
            itemCount: trees.length,
            itemBuilder: (context, i) {
              return TreeItem(
                title: trees[i].region,
                subtitle: trees[i].treeCaptureTime,
                imageUrl: trees[i].imageUrl,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryPage(trees[i].token)),
                  );
                },
              );
            }
          );
        }
      ),
    );
  }

}