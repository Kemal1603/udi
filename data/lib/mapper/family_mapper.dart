import 'package:data/entities/entities.dart';
import 'package:domain/models/models.dart';

abstract class FamilyMapper {
  static FamilyEntity toEntity(FamilyModel model) {
    return FamilyEntity(
      id: model.id,
      name: model.name,
      advertCount: model.advertCount,
    );
  }

  static FamilyModel toModel(FamilyEntity entity) {
    return FamilyModel(
      id: entity.id,
      name: entity.name,
      advertCount: entity.advertCount,
    );
  }
}
