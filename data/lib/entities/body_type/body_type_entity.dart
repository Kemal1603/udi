import 'package:freezed_annotation/freezed_annotation.dart';

part 'body_type_entity.freezed.dart';
part 'body_type_entity.g.dart';

@freezed
class BodyTypeEntity with _$BodyTypeEntity {
  const factory BodyTypeEntity({
    @Default('') @JsonKey(name: 'name') String name,
    @Default(0) @JsonKey(name: 'id') int id,
    @Default(0) @JsonKey(name: 'family_id') int familyId,
    @Default(0) @JsonKey(name: 'advert_count') int advertCount,
  }) = _BodyTypeEntity;

  factory BodyTypeEntity.fromJson(Map<String, dynamic> json) => _$BodyTypeEntityFromJson(json);
}
