import 'package:troken/network/Requests.dart';
import 'package:troken/network/Responses.dart';
import 'package:troken/network/TokenApi.dart';

class TokenModel {

  TokenApi _api;

  TokenModel(this._api);

  AccountResponse _currentAccountResponse;
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

  Future<AccountResponse> loadAccount() {
    if (_currentAccountResponse != null) {
      return Future.value(_currentAccountResponse);
    }
    return _api.accounts()
        .then((value) => value.accounts[0])
        .then((value) {
          _currentAccountResponse = value;
          return _currentAccountResponse;
        });
  }

  Future<TreeListResponse> loadTrees() {
    if (_currentTreeListResponse != null) {
      return Future.value(_currentTreeListResponse);
    }

    return _api.trees(_currentAccountResponse.wallet)
        .then((value) {
      _currentTreeListResponse = value;
      return _currentTreeListResponse;
    });
  }

}