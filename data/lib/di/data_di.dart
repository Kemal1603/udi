import 'package:core/config/app_config.dart';
import 'package:core/config/network/dio_config.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/domain.dart';

import '../errors/error_handler.dart';
import '../providers/api_provider.dart';
import '../repositories/filters_repository_impl.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    _initDio();
    _initApi();
    _initFilters();
  }

  void _initDio() {
    appLocator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: appLocator<AppConfig>(),
      ),
    );
  }

  void _initApi() {
    appLocator.registerLazySingleton<ErrorHandler>(
      ErrorHandler.new,
    );

    appLocator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(
        appLocator<DioConfig>().dio,
        baseUrl: appLocator<AppConfig>().baseUrl,
      ),
    );
  }

  void _initFilters() {
    appLocator.registerLazySingleton<FiltersRepository>(
      () => FiltersRepositoryImpl(
        apiProvider: appLocator<ApiProvider>(),
      ),
    );

    appLocator.registerLazySingleton<FetchBrandUseCase>(
      () => FetchBrandUseCase(filtersRepository: appLocator<FiltersRepository>()),
    );
    appLocator.registerLazySingleton<FetchModelUseCase>(
      () => FetchModelUseCase(filtersRepository: appLocator<FiltersRepository>()),
    );
    appLocator.registerLazySingleton<FetchBodyTypeUseCase>(
      () => FetchBodyTypeUseCase(filtersRepository: appLocator<FiltersRepository>()),
    );
    appLocator.registerLazySingleton<FetchGenerationUseCase>(
      () => FetchGenerationUseCase(filtersRepository: appLocator<FiltersRepository>()),
    );
    appLocator.registerLazySingleton<FetchAdvertUseCase>(
      () => FetchAdvertUseCase(filtersRepository: appLocator<FiltersRepository>()),
    );
    appLocator.registerLazySingleton<FetchCountriesUseCase>(
      () => FetchCountriesUseCase(filtersRepository: appLocator<FiltersRepository>()),
    );
  }
}
