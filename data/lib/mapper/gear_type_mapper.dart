import 'package:data/entities/entities.dart';
import 'package:domain/models/models.dart';

abstract class GearTypeMapper {
  static GearTypeEntity toEntity(GearTypeModel model) {
    return GearTypeEntity(
      id: model.id,
      name: model.name,
    );
  }

  static GearTypeModel toModel(GearTypeEntity entity) {
    return GearTypeModel(
      id: entity.id,
      name: entity.name,
    );
  }
}
