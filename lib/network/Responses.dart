
import 'package:json_annotation/json_annotation.dart';

part 'Responses.g.dart';


// GEN COMMAND: flutter packages pub run build_runner build

@JsonSerializable()
class AuthResponse {

  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "errors")
  List<ErrorResponse> errors;

  AuthResponse(this.token, this.errors);

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

}


@JsonSerializable()
class AccountsResponse {

  @JsonKey(name: "accounts")
  List<AccountResponse> accounts;
  @JsonKey(name: "errors")
  List<ErrorResponse> errors;

  AccountsResponse(this.accounts, this.errors);

  factory AccountsResponse.fromJson(Map<String, dynamic> json) => _$AccountsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AccountsResponseToJson(this);

}


@JsonSerializable()
class AccountResponse {

  // p or o
  @JsonKey(name: "type", required: true)
  String type;
  @JsonKey(name: "wallet", required: true)
  String wallet;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "first_name")
  String firstName;
  @JsonKey(name: "last_name")
  String lastName;
  @JsonKey(name: "access", required: true)
  String access;
  @JsonKey(name: "tokens_in_wallet", required: true)
  int tokenAmount;

  AccountResponse(this.type, this.wallet, this.email, this.phone, this.firstName, this.lastName, this.access, this.tokenAmount);

  factory AccountResponse.fromJson(Map<String, dynamic> json) => _$AccountResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AccountResponseToJson(this);

}

@JsonSerializable()
class ErrorResponse {

  @JsonKey(name: "value")
  String value;
  @JsonKey(name: "msg")
  String message;
  @JsonKey(name: "param")
  String param;
  @JsonKey(name: "location")
  String location;

  ErrorResponse(this.value, this.message, this.param, this.location);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

}