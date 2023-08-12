import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_model.freezed.dart';

@freezed
class BrandModel with _$BrandModel {
  factory BrandModel({
    required String name,
    required int id,
  }) = _BrandModel;
}
