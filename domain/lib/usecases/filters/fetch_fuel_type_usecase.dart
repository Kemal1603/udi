import '../../domain.dart';

final class FetchFuelTypeUseCase extends FutureUseCase<NoParams, List<FuelTypeModel>> {
  final FiltersRepository _filtersRepository;

  FetchFuelTypeUseCase({
    required FiltersRepository filtersRepository,
  }) : _filtersRepository = filtersRepository;

  @override
  Future<List<FuelTypeModel>> execute(NoParams input) {
    return _filtersRepository.fetchFuelTypes();
  }
}
