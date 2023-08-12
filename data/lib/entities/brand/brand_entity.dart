import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_entity.freezed.dart';
part 'brand_entity.g.dart';

@freezed
class BrandEntity with _$BrandEntity {
  factory BrandEntity({
    @Default('') @JsonKey(name: 'name') String name,
    @Default(0) @JsonKey(name: 'id') int id,
  }) = _BrandEntity;

  factory BrandEntity.fromJson(Map<String, dynamic> json) => _$BrandEntityFromJson(json);
}
