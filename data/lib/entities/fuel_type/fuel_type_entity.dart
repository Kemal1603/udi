import 'package:freezed_annotation/freezed_annotation.dart';

part 'fuel_type_entity.freezed.dart';
part 'fuel_type_entity.g.dart';

@freezed
class FuelTypeEntity with _$FuelTypeEntity {
  const factory FuelTypeEntity({
    @Default('') @JsonKey(name: 'name') String name,
    @Default(0) @JsonKey(name: 'id') int id,
  }) = _FuelTypeEntity;

  factory FuelTypeEntity.fromJson(Map<String, dynamic> json) => _$FuelTypeEntityFromJson(json);
}
