
import 'package:flutter/material.dart';
import 'package:troken/network/Responses.dart';

class AccountItem extends StatelessWidget {

  final AccountResponse account;
  final Function(AccountResponse) onTap;

  AccountItem({this.account, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onTap(account);
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Wallet: ${account.wallet}"),
                    SizedBox(width: 8),
                    Icon(getAccountIcon(account))
                  ],
                ),
                Text("Access: ${account.access}"),
                Text("Total Tokens: ${account.tokenAmount}"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData getAccountIcon(AccountResponse account) {
    return account.type == 'p' ? Icons.account_box : Icons.account_balance;
  }

}