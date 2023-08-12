import 'package:domain/domain.dart';

import '../entities/entities.dart';
import '../mapper/mappers.dart';
import '../providers/api_provider.dart';
import '../providers/safe_request.dart';

class FiltersRepositoryImpl implements FiltersRepository {
  final ApiProvider _apiProvider;

  FiltersRepositoryImpl({
    required ApiProvider apiProvider,
  }) : _apiProvider = apiProvider;

  @override
  Future<List<AdvertModel>> fetchAdverts(AdvertRequest request) async {
    final List<AdvertEntity> adverts = await safeRequest(
      () => _apiProvider.fetchAdverts(
        page: request.page,
        pageSize: request.pageSize,
        brandIds: request.brandIds,
        modelIds: request.modelIds,
        generationIds: request.generationIds,
        bodyTypeIds: request.bodyTypeIds,
        familyIds: request.familyIds,
      ),
    );

    return adverts.map(AdvertMapper.toModel).toList();
  }

  @override
  Future<List<BodyTypeModel>> fetchBodyTypes(List<int> familyIds) async {
    final List<BodyTypeEntity> bodyTypes = await safeRequest(
      () => _apiProvider.fetchBodyTypes(
        familyIds: familyIds,
      ),
    );

    return bodyTypes.map(BodyTypeMapper.toModel).toList();
  }

  @override
  Future<List<BrandModel>> fetchBrands() async {
    final List<BrandEntity> brands = await safeRequest(
      _apiProvider.fetchBrands,
    );

    return brands.map(BrandMapper.toModel).toList();
  }

  @override
  Future<List<GenerationModel>> fetchGeneration(List<int> modelIds) async {
    final List<GenerationEntity> generations = await safeRequest(
      () => _apiProvider.fetchGeneration(
        modelIds: modelIds,
      ),
    );

    return generations.map(GenerationMapper.toModel).toList();
  }

  @override
  Future<List<ModelModel>> fetchModels(List<int> brandIds) async {
    final List<ModelEntity> models = await safeRequest(
      () => _apiProvider.fetchModels(
        brandIds: brandIds,
      ),
    );

    return models.map(ModelMapper.toModel).toList();
  }
}