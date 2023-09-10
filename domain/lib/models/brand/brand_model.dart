import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'brand_model.freezed.dart';

@freezed
class BrandModel extends BaseItemModel with _$BrandModel {
  factory BrandModel({
    required String name,
    required int id,
    required int advertCount,
  }) = _BrandModel;
}
