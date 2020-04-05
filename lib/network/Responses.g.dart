// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return AuthResponse(
    json['token'] as String,
    (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : ErrorResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'errors': instance.errors,
    };

AccountsResponse _$AccountsResponseFromJson(Map<String, dynamic> json) {
  return AccountsResponse(
    (json['accounts'] as List)
        ?.map((e) => e == null
            ? null
            : AccountResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : ErrorResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AccountsResponseToJson(AccountsResponse instance) =>
    <String, dynamic>{
      'accounts': instance.accounts,
      'errors': instance.errors,
    };

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['type', 'wallet', 'access', 'tokens_in_wallet']);
  return AccountResponse(
    json['type'] as String,
    json['wallet'] as String,
    json['email'] as String,
    json['phone'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['access'] as String,
    json['tokens_in_wallet'] as String,
  );
}

Map<String, dynamic> _$AccountResponseToJson(AccountResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'wallet': instance.wallet,
      'email': instance.email,
      'phone': instance.phone,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'access': instance.access,
      'tokens_in_wallet': instance.tokenAmount,
    };

TreeListResponse _$TreeListResponseFromJson(Map<String, dynamic> json) {
  return TreeListResponse(
    (json['trees'] as List)
        ?.map((e) =>
            e == null ? null : TreeResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['wallet'] as String,
    json['wallet_url'] as String,
  );
}

Map<String, dynamic> _$TreeListResponseToJson(TreeListResponse instance) =>
    <String, dynamic>{
      'trees': instance.trees,
      'wallet': instance.wallet,
      'wallet_url': instance.walletUrl,
    };

TreeResponse _$TreeResponseFromJson(Map<String, dynamic> json) {
  return TreeResponse(
    json['token'] as String,
    json['map_url'] as String,
    json['image_url'] as String,
    json['tree_captured_at'] as String,
    json['latitude'] as String,
    json['longitude'] as String,
    json['region'] as String,
  );
}

Map<String, dynamic> _$TreeResponseToJson(TreeResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'map_url': instance.mapUrl,
      'image_url': instance.imageUrl,
      'tree_captured_at': instance.treeCaptureTime,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'region': instance.region,
    };

TreeHistoryResponse _$TreeHistoryResponseFromJson(Map<String, dynamic> json) {
  return TreeHistoryResponse(
    (json['history'] as List)
        ?.map((e) => e == null
            ? null
            : TreeHistoryLogResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TreeHistoryResponseToJson(
        TreeHistoryResponse instance) =>
    <String, dynamic>{
      'history': instance.logs,
    };

TreeHistoryLogResponse _$TreeHistoryLogResponseFromJson(
    Map<String, dynamic> json) {
  return TreeHistoryLogResponse(
    json['token'] as String,
    json['sender_wallet'] as String,
    json['receiver_wallet'] as String,
    json['processed_at'] as String,
  );
}

Map<String, dynamic> _$TreeHistoryLogResponseToJson(
        TreeHistoryLogResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'sender_wallet': instance.senderWallet,
      'receiver_wallet': instance.receiverWallet,
      'processed_at': instance.processedAt,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return ErrorResponse(
    json['value'] as String,
    json['msg'] as String,
    json['param'] as String,
    json['location'] as String,
  );
}

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'value': instance.value,
      'msg': instance.message,
      'param': instance.param,
      'location': instance.location,
    };
