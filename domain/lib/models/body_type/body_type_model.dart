import 'package:freezed_annotation/freezed_annotation.dart';

part 'body_type_model.freezed.dart';

@freezed
class BodyTypeModel with _$BodyTypeModel {
  const factory BodyTypeModel({
    required String name,
    required int id,
    required int familyId,
  }) = _BodyTypeModel;
}
