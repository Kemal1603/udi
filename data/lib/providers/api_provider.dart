import 'package:core/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_provider.g.dart';

abstract class ApiProvider {
  factory ApiProvider(Dio dio) = _ApiProvider;

  void setToken(String? token);

  @GET(ApiConstants.brand)
  Future<void> fetchBrands();

  @GET(ApiConstants.model)
  Future<void> fetchModels(
    @Query('brand_id__in') List<int> brandIds,
  );

  @GET(ApiConstants.generation)
  Future<void> fetchGeneration();

  @GET(ApiConstants.bodyType)
  Future<void> fetchBodyTypes();

  @GET(ApiConstants.advert)
  Future<void> fetchAdverts(
    @Query('page') int page,
    @Query('size') int pageSize,
  );
}
