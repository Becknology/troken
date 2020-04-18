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
          stream: Provider.of<TokenModel>(context).treeStream,
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
                      setState(() {
                        trees[i].isSelected = !trees[i].isSelected;
                      });
                    },
                  );
                }
            );
          }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Select Destination Wallet"),
                content: Container(
                    height: 200,
                    width: 100,
                    child: FutureBuilder<List<AccountResponse>>(
                        future: Provider.of<TokenModel>(context).getNonSelectedAccounts(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Text(snapshot.data[i].wallet),
                                onTap: () async {
                                  await Provider.of<TokenModel>(context).transfer(snapshot.data[i].wallet);
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          );
                        }
                    )
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Cancel"),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    }
                  ),
                ],
              );
            },
          );
        },
        label: Text("Send")),
    );
  }

}

