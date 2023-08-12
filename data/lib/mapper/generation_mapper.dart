import 'package:data/entities/entities.dart';
import 'package:domain/models/models.dart';

abstract class GenerationMapper {
  static GenerationEntity toEntity(GenerationModel model) {
    return GenerationEntity(
      id: model.id,
      name: model.name,
      modelId: model.modelId,
      productionFrom: model.productionFrom,
      productionTill: model.productionTill,
    );
  }

  static GenerationModel toModel(GenerationEntity entity) {
    return GenerationModel(
      id: entity.id,
      name: entity.name,
      modelId: entity.modelId,
      productionFrom: entity.productionFrom,
      productionTill: entity.productionTill,
    );
  }
}
