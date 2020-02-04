
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(nullable: false, required: true)
  final int userId;

  @JsonKey(nullable: false, required: true)
  final int id;

  @JsonKey(nullable: false, required: true)
  final String title;

  @JsonKey(nullable: false, required: true)
  final bool completed;

  User({this.userId, this.id, this.title, this.completed});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
  
}