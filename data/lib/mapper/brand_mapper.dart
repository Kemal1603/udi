import 'package:data/entities/entities.dart';
import 'package:domain/models/models.dart';

abstract class BrandMapper {
  static BrandEntity toEntity(BrandModel model) {
    return BrandEntity(
      id: model.id,
      name: model.name,
      advertCount: model.advertCount,
    );
  }

  static BrandModel toModel(BrandEntity entity) {
    return BrandModel(
      id: entity.id,
      name: entity.name,
      advertCount: entity.advertCount,
    );
  }
}
