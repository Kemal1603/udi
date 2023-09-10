import 'package:freezed_annotation/freezed_annotation.dart';

part 'advert_model.freezed.dart';

@freezed
class AdvertModel with _$AdvertModel {
  const factory AdvertModel({
    required int familyId,
    required int brandId,
    required int modelId,
    required int generationId,
    required int bodyTypeId,
    required int modificationId,
    required int sourceId,
    required int sellerId,
    required String sourceUrl,
    required List<String> imageUrls,
    required int millage,
    required int gearId,
    required String dateOfIssue,
    required int fuelId,
    required int locationId,
    required String motorPower,
    required int price,
    required int id,
    required String created,
    required String modified,
    required String familyName,
    required String brandName,
    required String modelName,
    required String generationName,
    required String bodyTypeName,
    required String fuelName,
    required String gearName,
    required String countryCode,
  }) = _AdvertModel;
}
