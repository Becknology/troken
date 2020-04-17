// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRequest _$AuthRequestFromJson(Map<String, dynamic> json) {
  return AuthRequest(
    json['wallet'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$AuthRequestToJson(AuthRequest instance) =>
    <String, dynamic>{
      'wallet': instance.wallet,
      'password': instance.password,
    };

TransferRequest _$TransferRequestFromJson(Map<String, dynamic> json) {
  return TransferRequest(
    (json['tokens'] as List)?.map((e) => e as String)?.toList(),
    json['sender_wallet'] as String,
    json['receiver_wallet'] as String,
  );
}

Map<String, dynamic> _$TransferRequestToJson(TransferRequest instance) =>
    <String, dynamic>{
      'tokens': instance.tokens,
      'sender_wallet': instance.senderWallet,
      'receiver_wallet': instance.receiverWallet,
    };
