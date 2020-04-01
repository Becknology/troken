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
