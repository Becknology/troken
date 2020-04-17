import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troken/AccountItem.dart';
import 'package:troken/TreesPage.dart';

import 'LCEFutureBuilder.dart';
import 'model/TokenModel.dart';
import 'network/Responses.dart';

class AccountPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AccountPageState();

}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    Provider.of<TokenModel>(context).loadAccounts();
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: LCEStreamBuilder<List<AccountResponse>>(
          stream: Provider.of<TokenModel>(context).accountStream,
          builder: (context, snapshot) {
            return loadedState(context, snapshot.data);
          }
      ),
    );
  }

  Widget loadedState(BuildContext context, List<AccountResponse> accounts) {
    return ListView.builder(
      itemCount: accounts.length ,
      itemBuilder: (context, i) {
        return AccountItem(
          account: accounts[i],
          onTap: (account) {
            print(account.wallet);
            Provider.of<TokenModel>(context).setSelectedAccount(account);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TreesPage()),
            );
          },
        );
      }
    );
  }

}