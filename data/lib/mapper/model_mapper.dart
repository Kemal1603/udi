import 'package:data/entities/entities.dart';
import 'package:domain/models/models.dart';

abstract class ModelMapper {
  static ModelEntity toEntity(ModelModel model) {
    return ModelEntity(
      brandId: model.brandId,
      id: model.id,
      name: model.name,
      advertCount: model.advertCount,
    );
  }

  static ModelModel toModel(ModelEntity entity) {
    return ModelModel(
      brandId: entity.brandId,
      id: entity.id,
      name: entity.name,
      advertCount: entity.advertCount,
    );
  }
}
