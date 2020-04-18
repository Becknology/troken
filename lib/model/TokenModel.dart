import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:troken/model/Tree.dart';
import 'package:troken/network/Requests.dart';
import 'package:troken/network/Responses.dart';
import 'package:troken/network/TokenApi.dart';

class TokenModel {

  TokenApi _api;

  TokenModel(this._api);

  AccountResponse _currentAccount;

  BehaviorSubject<List<Tree>> _treeStream = new BehaviorSubject();
  Stream<List<Tree>> get trees => _treeStream.stream;

  BehaviorSubject<List<AccountResponse>> accountStream = new BehaviorSubject();
  Stream<List<AccountResponse>> get accounts => accountStream.stream;

  AccountResponse getSelectedAccount() {
    return _currentAccount;
  }

  void setSelectedAccount(AccountResponse account) {
    _currentAccount = account;
  }

  void selectTree(Tree tree) {
    List<Tree> trees = _treeStream.value;

    trees = trees.map((item) {
      if (tree.token == item.token) {
        tree.isSelected = !tree.isSelected;
      }
      return item;
    }).toList();

    _treeStream.add(trees);
  }

  Future<bool> login(String username, String password) {
    return _api.authenticate(AuthRequest(username, password))
        .catchError((e) => false)
        .then((response) {
          if (response.errors == null) {
            _api.setUserToken(response.token);
            print("GOOD response");
            return true;
          } else {
            print("ERROR response");
            return false;
          }
        }, onError: (e) {
          print("REAL ERROR");
          return false;
    });
  }

  void loadAccounts({bool refresh = false}) {
    if (refresh || accountStream.value == null) {
      _api.accounts().then((response) => accountStream.add(response.accounts));
    }
  }

  void loadTrees({bool refresh = false}) {
    _api.trees(_currentAccount.wallet)
        .then((value) {
      List<Tree> trees = new List();
      for(var v in value.trees) {
        trees.add(Tree(v.token,
            v.mapUrl,
            v.imageUrl,
            v.treeCaptureTime,
            v.latitude,
            v.longitude,
            v.region));
      }
      return trees;
    }).then((trees) => _treeStream.add(trees));
  }

  Future<List<AccountResponse>> getNonSelectedAccounts() {
    if (accountStream.value != null && _currentAccount != null) {
      return Future.value(accountStream.value.where((account) => account.wallet != _currentAccount.wallet).toList());
    } else {
      return Future.error(Exception("No Accounts Loaded"));
    }
  }

  Future<List<TreeHistoryLogResponse>> loadHistory(String treeToken) {
     return _api.history(treeToken).then((historyResponse) => historyResponse.logs);
  }

  Future<TransferResponse> transfer(String toWallet) async {
    List<Tree> trees = _treeStream.value;

    List<String> tokensToTransfer = trees
        .where((tree) => tree.isSelected)
        .map((tree) => tree.token)
        .toList();

    var response = await _api.transfer(TransferRequest(tokensToTransfer, _currentAccount.wallet, toWallet));

    loadAccounts(refresh: true);
    loadTrees(refresh: true);

    return response;
  }

}