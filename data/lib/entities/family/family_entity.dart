import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_entity.freezed.dart';
part 'family_entity.g.dart';

@freezed
class FamilyEntity with _$FamilyEntity {
  const factory FamilyEntity({
    @Default('') @JsonKey(name: 'name') String name,
    @Default(0) @JsonKey(name: 'id') int id,
    @Default(0) @JsonKey(name: 'advert_count') int advertCount,
  }) = _FamilyEntity;

  factory FamilyEntity.fromJson(Map<String, dynamic> json) => _$FamilyEntityFromJson(json);
}
