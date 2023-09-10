import 'package:freezed_annotation/freezed_annotation.dart';

part 'advert_entity.freezed.dart';
part 'advert_entity.g.dart';

@freezed
class AdvertEntity with _$AdvertEntity {
  const factory AdvertEntity({
    @Default(0) @JsonKey(name: 'family_id') int familyId,
    @Default(0) @JsonKey(name: 'brand_id') int brandId,
    @Default(0) @JsonKey(name: 'model_id') int modelId,
    @Default(0) @JsonKey(name: 'generation_id') int generationId,
    @Default(0) @JsonKey(name: 'body_type_id') int bodyTypeId,
    @Default(0) @JsonKey(name: 'modification_id') int modificationId,
    @Default(0) @JsonKey(name: 'source_id') int sourceId,
    @Default(0) @JsonKey(name: 'seller_id') int sellerId,
    @Default('') @JsonKey(name: 'source_url') String sourceUrl,
    @Default([]) @JsonKey(name: 'image_urls') List<String> imageUrls,
    @Default(0) @JsonKey(name: 'millage') int millage,
    @Default(0) @JsonKey(name: 'gear_id') int gearId,
    @Default('') @JsonKey(name: 'date_of_issue') String dateOfIssue,
    @Default(0) @JsonKey(name: 'fuel_id') int fuelId,
    @Default(0) @JsonKey(name: 'location_id') int locationId,
    @Default('') @JsonKey(name: 'motor_power') String motorPower,
    @Default(0) @JsonKey(name: 'price') int price,
    @Default(0) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'created') String created,
    @Default('') @JsonKey(name: 'modified') String modified,
    @Default('') @JsonKey(name: 'family_name') String familyName,
    @Default('') @JsonKey(name: 'brand_name') String brandName,
    @Default('') @JsonKey(name: 'model_name') String modelName,
    @Default('') @JsonKey(name: 'generation_name') String generationName,
    @Default('') @JsonKey(name: 'body_type_name') String bodyTypeName,
    @Default('') @JsonKey(name: 'fuel_name') String fuelName,
    @Default('') @JsonKey(name: 'gear_name') String gearName,
    @Default('') @JsonKey(name: 'country_code') String countryCode,
  }) = _AdvertEntity;

  factory AdvertEntity.fromJson(Map<String, dynamic> json) => _$AdvertEntityFromJson(json);
}
