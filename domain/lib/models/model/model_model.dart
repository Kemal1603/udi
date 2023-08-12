import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_model.freezed.dart';

@freezed
class ModelModel with _$ModelModel {
  const factory ModelModel({
    required String name,
    required int id,
    required int brandId,
    required int familyId,
  }) = _ModelModel;
}
