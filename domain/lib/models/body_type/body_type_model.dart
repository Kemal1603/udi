import 'package:freezed_annotation/freezed_annotation.dart';

import '../base_item_model.dart';

part 'body_type_model.freezed.dart';

@freezed
class BodyTypeModel extends BaseItemModel with _$BodyTypeModel {
  const factory BodyTypeModel({
    required String name,
    required int id,
    required int familyId,
    required int advertCount,
  }) = _BodyTypeModel;
}
