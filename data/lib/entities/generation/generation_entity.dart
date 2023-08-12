import 'package:freezed_annotation/freezed_annotation.dart';

part 'generation_entity.freezed.dart';
part 'generation_entity.g.dart';

@freezed
class GenerationEntity with _$GenerationEntity {
  const factory GenerationEntity({
    @Default('') @JsonKey(name: 'name') String name,
    @Default(0) @JsonKey(name: 'id') int id,
    @Default(0) @JsonKey(name: 'model_id') int modelId,
    @Default('') @JsonKey(name: 'production_from') String productionFrom,
    @Default('') @JsonKey(name: 'production_till') String productionTill,
  }) = _GenerationEntity;

  factory GenerationEntity.fromJson(Map<String, dynamic> json) => _$GenerationEntityFromJson(json);
}
