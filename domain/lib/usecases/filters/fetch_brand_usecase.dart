import '../../domain.dart';

final class FetchBrandUseCase extends FutureUseCase<NoParams, List<BrandModel>> {
  final FiltersRepository _filtersRepository;

  FetchBrandUseCase({
    required FiltersRepository filtersRepository,
  }) : _filtersRepository = filtersRepository;

  @override
  Future<List<BrandModel>> execute(NoParams input) {
    return _filtersRepository.fetchBrands();
  }
}
