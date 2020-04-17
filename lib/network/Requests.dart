
import 'package:json_annotation/json_annotation.dart';

part 'Requests.g.dart';


// GEN COMMAND: flutter packages pub run build_runner build

@JsonSerializable()
class AuthRequest {

  @JsonKey(name: "wallet")
  String wallet;
  @JsonKey(name: "password")
  String password;

  AuthRequest(this.wallet, this.password);

  factory AuthRequest.fromJson(Map<String, dynamic> json) => _$AuthRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);

}

@JsonSerializable()
class TransferRequest {

  @JsonKey(name: "tokens")
  List<String> tokens;
  @JsonKey(name: "sender_wallet")
  String senderWallet;
  @JsonKey(name: "receiver_wallet")
  String receiverWallet;

  TransferRequest(this.tokens, this.senderWallet, this.receiverWallet);

  factory TransferRequest.fromJson(Map<String, dynamic> json) => _$TransferRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TransferRequestToJson(this);

}