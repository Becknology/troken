

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LCEFutureBuilder.dart';
import 'TokenModel.dart';
import 'network/Responses.dart';

class AccountPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AccountPageState();

}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: LCEFutureBuilder<AccountResponse>(
          future: Provider.of<TokenModel>(context).loadAccount(),
          builder: (context, snapshot) {
            return loadedState(context, snapshot.data);
          }
      ),
    );
  }

  Widget loadedState(BuildContext context, AccountResponse response) {
    return Column(
      children: <Widget>[
        Text("Type: ${response.access == "p" ? "Personal" : "Organization" }"),
        Text("Name: ${response.firstName} ${response.lastName}"),
        Text("Wallet: ${response.wallet}"),
        Text("Email: ${response.email}"),
        Text("Phone: ${response.phone}"),
        Text("Access: ${response.access}"),
        Text("Total Tokens: ${response.tokenAmount}"),
      ],
    );
  }

}