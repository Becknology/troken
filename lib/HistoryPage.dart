import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troken/LCEFutureBuilder.dart';
import 'package:troken/TokenModel.dart';
import 'package:troken/TreeLogItem.dart';
import 'package:troken/network/Responses.dart';

class HistoryPage extends StatelessWidget {

  final String treeToken;

  HistoryPage(this.treeToken);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction History"),
      ),
      body: LCEFutureBuilder<List<TreeHistoryLogResponse>>(
        future: Provider.of<TokenModel>(context).loadHistory(treeToken),
        builder: (context, snapshot) {
          var logs = snapshot.data;
          return ListView.builder(
              itemCount: logs.length,
              itemBuilder: (context, i) {
                return TreeLogItem(
                  from: logs[i].senderWallet,
                  to: logs[i].receiverWallet,
                  date: logs[i].processedAt,
                );
              }
          );
        }
      ),
    );
  }

}