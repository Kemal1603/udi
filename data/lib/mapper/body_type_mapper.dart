import 'package:data/entities/entities.dart';
import 'package:domain/models/models.dart';

abstract class BodyTypeMapper {
  static BodyTypeEntity toEntity(BodyTypeModel model) {
    return BodyTypeEntity(
      id: model.id,
      name: model.name,
      familyId: model.familyId,
    );
  }

  static BodyTypeModel toModel(BodyTypeEntity entity) {
    return BodyTypeModel(
      id: entity.id,
      name: entity.name,
      familyId: entity.familyId,
    );
  }
}
