import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'family_model.freezed.dart';

@freezed
class FamilyModel extends BaseItemModel with _$FamilyModel {
  factory FamilyModel({
    required String name,
    required int id,
    required int advertCount,
  }) = _FamilyModel;
}
