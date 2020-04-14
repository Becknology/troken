

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troken/AccountItem.dart';
import 'package:troken/TreesPage.dart';

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
      body: LCEFutureBuilder<List<AccountResponse>>(
          future: Provider.of<TokenModel>(context).loadAccounts(),
          builder: (context, snapshot) {
            return loadedState(context, snapshot.data);
          }
      ),
    );
  }

  Widget loadedState(BuildContext context, List<AccountResponse> accounts) {
    return ListView.builder(
      itemCount: accounts.length,
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