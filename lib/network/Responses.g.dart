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
