import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troken/HistoryPage.dart';
import 'package:troken/LCEFutureBuilder.dart';
import 'package:troken/model/TokenModel.dart';
import 'package:troken/TreeItem.dart';
import 'package:troken/model/Tree.dart';
import 'package:troken/network/Responses.dart';

class TransferPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TransferPageState();

}

class _TransferPageState extends State<TransferPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer"),
      ),
      body: LCEStreamBuilder<List<Tree>>(
          stream: Provider.of<TokenModel>(context).trees,
          builder: (context, snapshot) {
            var trees = snapshot.data;
            return ListView.builder(
                itemCount: trees.length,
                itemBuilder: (context, i) {
                  return TreeItem(
                    title: trees[i].region,
                    subtitle: trees[i].treeCaptureTime,
                    imageUrl: trees[i].imageUrl,
                    isSelected: trees[i].isSelected,
                    onTap: () {
//                      setState(() {
//                        trees[i].isSelected = !trees[i].isSelected;
//                      });
                    },
                  );
                }
            );
          }
      ),
    );
  }

}

