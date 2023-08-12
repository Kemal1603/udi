import 'package:freezed_annotation/freezed_annotation.dart';

part 'generation_model.freezed.dart';

@freezed
class GenerationModel with _$GenerationModel {
  const factory GenerationModel({
    required String name,
    required int id,
    required int modelId,
    required String productionFrom,
    required String productionTill,
  }) = _GenerationModel;
}
