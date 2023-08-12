import '../domain.dart';

abstract class FiltersRepository {
  Future<List<BrandModel>> fetchBrands();

  Future<List<ModelModel>> fetchModels(List<int> brandIds);

  Future<List<GenerationModel>> fetchGeneration(List<int> modelIds);

  Future<List<BodyTypeModel>> fetchBodyTypes(List<int> familyIds);

  Future<List<AdvertModel>> fetchAdverts(AdvertRequest request);
}