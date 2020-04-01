
import 'package:json_annotation/json_annotation.dart';

part 'Responses.g.dart';


// GEN COMMAND: flutter packages pub run build_runner build

@JsonSerializable()
class AuthResponse {

  @JsonKey(name: "token")
  String token;

  AuthResponse(this.token);

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

}