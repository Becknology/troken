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
  Map<String, List<Tree>> _currentTreeListResponseMap = new Map();

  BehaviorSubject<List<AccountResponse>> accountStream = new BehaviorSubject();
  Stream<List<AccountResponse>> get accounts => accountStream.stream;

  AccountResponse getSelectedAccount() {
    return _currentAccount;
  }

  void setSelectedAccount(AccountResponse account) {
    _currentAccount = account;
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

  Future<List<AccountResponse>> getNonSelectedAccounts() {
    if (accountStream.value != null && _currentAccount != null) {
      return Future.value(accountStream.value.where((account) => account.wallet != _currentAccount.wallet).toList());
    } else {
      return Future.error(Exception("No Accounts Loaded"));
    }
  }

  Future<List<Tree>> loadTrees() {
    if (_currentTreeListResponseMap.containsKey(_currentAccount.wallet)) {
      return Future.value(_currentTreeListResponseMap[_currentAccount.wallet]);
    }

    return _api.trees(_currentAccount.wallet)
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
        })
        .then((value) {
      _currentTreeListResponseMap.putIfAbsent(_currentAccount.wallet, () => value);
      return _currentTreeListResponseMap[_currentAccount.wallet];
    });
  }

  Future<List<TreeHistoryLogResponse>> loadHistory(String treeToken) {
     return _api.history(treeToken).then((historyResponse) => historyResponse.logs);
  }

  Future<TransferResponse> transfer(String toWallet) async {
    List<Tree> trees = await loadTrees();

    List<String> tokensToTransfer = trees
        .where((tree) => tree.isSelected)
        .map((tree) => tree.token)
        .toList();

    var response = await _api.transfer(TransferRequest(tokensToTransfer, _currentAccount.wallet, toWallet));

    loadAccounts(refresh: true);

    return response;
  }

}