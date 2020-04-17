
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
  String tokenAmount;

  AccountResponse(this.type, this.wallet, this.email, this.phone, this.firstName, this.lastName, this.access, this.tokenAmount);

  factory AccountResponse.fromJson(Map<String, dynamic> json) => _$AccountResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AccountResponseToJson(this);

}

@JsonSerializable()
class TreeListResponse {

  @JsonKey(name: "trees")
  List<TreeResponse> trees;
  @JsonKey(name: "wallet")
  String wallet;
  @JsonKey(name: "wallet_url")
  String walletUrl;

  TreeListResponse(this.trees, this.wallet, this.walletUrl);

  factory TreeListResponse.fromJson(Map<String, dynamic> json) => _$TreeListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TreeListResponseToJson(this);

}

@JsonSerializable()
class TreeResponse {

  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "map_url")
  String mapUrl;
  @JsonKey(name: "image_url")
  String imageUrl;
  @JsonKey(name: "tree_captured_at")
  String treeCaptureTime;
  @JsonKey(name: "latitude")
  String latitude;
  @JsonKey(name: "longitude")
  String longitude;
  @JsonKey(name: "region")
  String region;

  TreeResponse(this.token, this.mapUrl, this.imageUrl, this.treeCaptureTime, this.latitude, this.longitude, this.region);

  factory TreeResponse.fromJson(Map<String, dynamic> json) => _$TreeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TreeResponseToJson(this);

}

@JsonSerializable()
class TreeHistoryResponse {

  @JsonKey(name: "history")
  List<TreeHistoryLogResponse> logs;

  TreeHistoryResponse(this.logs);

  factory TreeHistoryResponse.fromJson(Map<String, dynamic> json) => _$TreeHistoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TreeHistoryResponseToJson(this);

}

@JsonSerializable()
class TreeHistoryLogResponse {

  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "sender_wallet")
  String senderWallet;
  @JsonKey(name: "receiver_wallet")
  String receiverWallet;
  @JsonKey(name: "processed_at")
  String processedAt;

  TreeHistoryLogResponse(this.token, this.senderWallet, this.receiverWallet, this.processedAt);

  factory TreeHistoryLogResponse.fromJson(Map<String, dynamic> json) => _$TreeHistoryLogResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TreeHistoryLogResponseToJson(this);

}

@JsonSerializable()
class TransferResponse {

  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "wallet_url")
  String walletUrl;
  @JsonKey(name: "errors")
  List<ErrorResponse> errors;

  TransferResponse(this.status, this.walletUrl, this.errors);

  factory TransferResponse.fromJson(Map<String, dynamic> json) => _$TransferResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TransferResponseToJson(this);

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