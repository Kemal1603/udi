import 'package:data/entities/entities.dart';
import 'package:domain/models/models.dart';

abstract class FuelTypeMapper {
  static FuelTypeEntity toEntity(FuelTypeModel model) {
    return FuelTypeEntity(
      id: model.id,
      name: model.name,
    );
  }

  static FuelTypeModel toModel(FuelTypeEntity entity) {
    return FuelTypeModel(
      id: entity.id,
      name: entity.name,
    );
  }
}
