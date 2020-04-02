
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