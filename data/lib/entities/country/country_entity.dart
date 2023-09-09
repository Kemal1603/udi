import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_entity.freezed.dart';
part 'country_entity.g.dart';

@freezed
class CountryEntity with _$CountryEntity {
  factory CountryEntity({
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'country_code') String code,
    @Default(0) @JsonKey(name: 'id') int id,
  }) = _CountryEntity;

  factory CountryEntity.fromJson(Map<String, dynamic> json) => _$CountryEntityFromJson(json);
}
