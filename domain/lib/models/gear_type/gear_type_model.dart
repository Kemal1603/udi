import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'gear_type_model.freezed.dart';

@freezed
class GearTypeModel extends BaseItemModel with _$GearTypeModel {
  factory GearTypeModel({
    required String name,
    required int id,
  }) = _GearTypeModel;
}
