import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'model_model.freezed.dart';

@freezed
class ModelModel extends BaseItemModel with _$ModelModel {
  const factory ModelModel({
    required String name,
    required int id,
    required int brandId,
    required int advertCount,
  }) = _ModelModel;
}
