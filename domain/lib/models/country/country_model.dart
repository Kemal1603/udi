import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'country_model.freezed.dart';

@freezed
class CountryModel extends BaseItemModel with _$CountryModel {
  factory CountryModel({
    required String name,
    required String code,
    required int id,
  }) = _CountryModel;
}
