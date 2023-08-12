import 'package:data/entities/entities.dart';
import 'package:domain/models/models.dart';

abstract class AdvertMapper {
  static AdvertEntity toEntity(AdvertModel model) {
    return AdvertEntity(
      familyId: model.familyId,
      generationId: model.generationId,
      id: model.id,
      modelId: model.modelId,
      bodyTypeId: model.bodyTypeId,
      modificationId: model.modificationId,
      sourceId: model.sourceId,
      sellerId: model.sellerId,
      sourceUrl: model.sourceUrl,
      imageUrls: model.imageUrls,
      millage: model.millage,
      gearId: model.gearId,
      dateOfIssue: model.dateOfIssue,
      fuelId: model.fuelId,
      locationId: model.locationId,
      motorPower: model.motorPower,
      price: model.price,
      created: model.created,
      modified: model.modified,
      brandId: model.brandId,
    );
  }

  static AdvertModel toModel(AdvertEntity entity) {
    return AdvertModel(
      familyId: entity.familyId,
      generationId: entity.generationId,
      id: entity.id,
      modelId: entity.modelId,
      bodyTypeId: entity.bodyTypeId,
      modificationId: entity.modificationId,
      sourceId: entity.sourceId,
      sellerId: entity.sellerId,
      sourceUrl: entity.sourceUrl,
      imageUrls: entity.imageUrls,
      millage: entity.millage,
      gearId: entity.gearId,
      dateOfIssue: entity.dateOfIssue,
      fuelId: entity.fuelId,
      locationId: entity.locationId,
      motorPower: entity.motorPower,
      price: entity.price,
      created: entity.created,
      modified: entity.modified,
      brandId: entity.brandId,
    );
  }
}
