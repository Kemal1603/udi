import 'package:data/entities/entities.dart';
import 'package:domain/models/models.dart';

abstract class CountryMapper {
  static CountryEntity toEntity(CountryModel model) {
    return CountryEntity(
      id: model.id,
      name: model.name,
      code: model.code,
    );
  }

  static CountryModel toModel(CountryEntity entity) {
    return CountryModel(
      id: entity.id,
      name: entity.name,
      code: entity.code,
    );
  }
}
