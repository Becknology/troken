import 'package:troken/network/Requests.dart';
import 'package:troken/network/Responses.dart';
import 'package:troken/network/TokenApi.dart';

class TokenModel {

  TokenApi _api;

  TokenModel(this._api);

  List<AccountResponse> _accounts;
  AccountResponse _currentAccount;
  TreeListResponse _currentTreeListResponse;

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

  Future<List<AccountResponse>> loadAccounts() {
    if (_accounts != null) {
      print("ACCOUNT CACHE");
      return Future.value(_accounts);
    }
    print("ACCOUNT API");
    return _api.accounts()
        .then((value) {
          _accounts = value.accounts;
          return _accounts;
        });
  }

  Future<TreeListResponse> loadTrees() {
    if (_currentTreeListResponse != null) {
      return Future.value(_currentTreeListResponse);
    }

    return _api.trees(_currentAccount.wallet)
        .then((value) {
      _currentTreeListResponse = value;
      return _currentTreeListResponse;
    });
  }

  Future<List<TreeHistoryLogResponse>> loadHistory(String treeToken) {
     return _api.history(treeToken).then((historyResponse) => historyResponse.logs);
  }

}