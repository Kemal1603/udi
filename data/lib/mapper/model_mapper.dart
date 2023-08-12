import 'package:data/entities/entities.dart';
import 'package:domain/models/models.dart';

abstract class ModelMapper {
  static ModelEntity toEntity(ModelModel model) {
    return ModelEntity(
      brandId: model.brandId,
      familyId: model.familyId,
      id: model.id,
      name: model.name,
    );
  }

  static ModelModel toModel(ModelEntity entity) {
    return ModelModel(
      brandId: entity.brandId,
      familyId: entity.familyId,
      id: entity.id,
      name: entity.name,
    );
  }
}
