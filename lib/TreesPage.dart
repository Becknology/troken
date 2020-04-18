import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troken/HistoryPage.dart';
import 'package:troken/LCEFutureBuilder.dart';
import 'package:troken/model/TokenModel.dart';
import 'package:troken/TransferPage.dart';
import 'package:troken/TreeItem.dart';
import 'package:troken/model/Tree.dart';
import 'package:troken/network/Responses.dart';
import 'package:url_launcher/url_launcher.dart';

class TreesPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TreesPageState();

}

class _TreesPageState extends State<TreesPage> {

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<TokenModel>(context);
    model.loadTrees();
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Trees"),
      ),
      body: LCEStreamBuilder<List<Tree>>(
        stream: model.trees,
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
                  model.selectTree(trees[i]);
                },
                onTapImage: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => _TreeImagePage(trees[i].imageUrl)),
                  );
                },
                onTapHistory: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryPage(trees[i].token)),
                  );
                },
                onTapMap: () async {
                  if (await canLaunch(trees[i].mapUrl)) {
                    await launch(trees[i].mapUrl);
                  } else {
                    throw 'Could not launch ${trees[i].mapUrl}';
                  }
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
                          future: model.getNonSelectedAccounts(),
                          builder: (context, snapshot) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  title: Text(snapshot.data[i].wallet),
                                  onTap: () async {
                                    await model.transfer(snapshot.data[i].wallet);
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

class _TreeImagePage extends StatelessWidget {

  final String imageUrl;

  _TreeImagePage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          color: Colors.black,
          child: Center(
            child: Hero(
              tag: imageUrl,
              child: Image.network(imageUrl)
            )
          ),
        ),
      ),
    );
  }

}

