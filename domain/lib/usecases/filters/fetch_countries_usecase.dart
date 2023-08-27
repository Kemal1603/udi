import '../../domain.dart';

final class FetchCountriesUseCase extends FutureUseCase<NoParams, List<CountryModel>> {
  final FiltersRepository _filtersRepository;

  FetchCountriesUseCase({
    required FiltersRepository filtersRepository,
  }) : _filtersRepository = filtersRepository;

  @override
  Future<List<CountryModel>> execute(NoParams input) {
    return _filtersRepository.fetchCountry();
  }
}
