import 'package:freezed_annotation/freezed_annotation.dart';

part 'gear_type_entity.freezed.dart';
part 'gear_type_entity.g.dart';

@freezed
class GearTypeEntity with _$GearTypeEntity {
  const factory GearTypeEntity({
    @Default('') @JsonKey(name: 'name') String name,
    @Default(0) @JsonKey(name: 'id') int id,
  }) = _GearTypeEntity;

  factory GearTypeEntity.fromJson(Map<String, dynamic> json) => _$GearTypeEntityFromJson(json);
}
