import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_entity.freezed.dart';
part 'model_entity.g.dart';

@freezed
class ModelEntity with _$ModelEntity {
  const factory ModelEntity({
    @Default('') @JsonKey(name: 'name') String name,
    @Default(0) @JsonKey(name: 'id') int id,
    @Default(0) @JsonKey(name: 'brand_id') int brandId,
    @Default(0) @JsonKey(name: 'family_id') int familyId,
  }) = _ModelEntity;

  factory ModelEntity.fromJson(Map<String, dynamic> json) => _$ModelEntityFromJson(json);
}
