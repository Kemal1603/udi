import 'package:core/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entities/entities.dart';

part 'api_provider.g.dart';

@RestApi()
abstract class ApiProvider {
  factory ApiProvider(
    Dio dio, {
    String baseUrl,
  }) = _ApiProvider;

  @GET(ApiConstants.brand)
  Future<List<BrandEntity>> fetchBrands();

  @GET(ApiConstants.model)
  Future<List<ModelEntity>> fetchModels({
    @Query('brand_id__in') required List<int> brandIds,
  });

  @GET(ApiConstants.generation)
  Future<List<GenerationEntity>> fetchGeneration({
    @Query('model_id__in') required List<int> modelIds,
  });

  @GET(ApiConstants.bodyType)
  Future<List<BodyTypeEntity>> fetchBodyTypes({
    @Query('family_id__in') required List<int> familyIds,
  });

  @GET(ApiConstants.advert)
  Future<List<AdvertEntity>> fetchAdverts({
    @Query('page') required int page,
    @Query('size') required int pageSize,
    @Query('brand_id__in') List<int>? brandIds,
    @Query('model_id__in') List<int>? modelIds,
    @Query('generation_id__in') List<int>? generationIds,
    @Query('body_type_id__in') List<int>? bodyTypeIds,
    @Query('family_id__in') List<int>? familyIds,
  });

  @GET(ApiConstants.country)
  Future<List<CountryEntity>> fetchCountry();
}
