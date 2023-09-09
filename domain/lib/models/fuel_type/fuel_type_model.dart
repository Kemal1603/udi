import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'fuel_type_model.freezed.dart';

@freezed
class FuelTypeModel extends BaseItemModel with _$FuelTypeModel {
  factory FuelTypeModel({
    required String name,
    required int id,
  }) = _FuelTypeModel;
}
