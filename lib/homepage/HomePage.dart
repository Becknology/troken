import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troken/TokenModel.dart';
import 'package:troken/network/Responses.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Troken"),
      ),
      body: FutureBuilder<AccountResponse>(
        future: Provider.of<TokenModel>(context).loadAccount(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return loadedState(context, snapshot.data);
          } else {
            return loadingState(context);
          }
        }
      )
    );
  }

  Widget loadedState(BuildContext context, AccountResponse response) {
    return Column(
      children: <Widget>[
        Text("Type: ${response.access == 'p' ? "Personal" : "Organization" }"),
        Text("Name: ${response.firstName} ${response.lastName}"),
        Text("Wallet: ${response.wallet}"),
        Text("Email: ${response.email}"),
        Text("Phone: ${response.phone}"),
        Text("Access: ${response.access}"),
        Text("Total Tokens: ${response.tokenAmount}"),
      ],
    );
  }

  Widget loadingState(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

}