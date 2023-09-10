import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'filter_model.freezed.dart';

@freezed
class FilterModel with _$FilterModel {
  const FilterModel._();

  const factory FilterModel({
    @Default(<int>[]) List<int> familyIDs,
    @Default(<int>[]) List<int> modelIDs,
    @Default(<int>[]) List<int> brandIDs,
    @Default(<int>[]) List<int> generationIDs,
    @Default(<int>[]) List<int> bodyTypeIDs,
    @Default(<int>[]) List<int> fuelTypeIDs,
    @Default(<int>[]) List<int> transmissionTypeIDs,
    @Default(<int>[]) List<int> driveTypeIDs,
  }) = _FilterModel;

  AdvertRequest toAdvertRequest({
    int page = 1,
    int pageSize = 20,
  }) {
    return AdvertRequest(
      page: page,
      pageSize: pageSize,
      bodyTypeIds: bodyTypeIDs,
      brandIds: brandIDs,
      familyIds: familyIDs,
      generationIds: generationIDs,
      modelIds: modelIDs,
    );
  }
}
