import '../../domain.dart';

final class FetchGearTypeUseCase extends FutureUseCase<NoParams, List<GearTypeModel>> {
  final FiltersRepository _filtersRepository;

  FetchGearTypeUseCase({
    required FiltersRepository filtersRepository,
  }) : _filtersRepository = filtersRepository;

  @override
  Future<List<GearTypeModel>> execute(NoParams input) {
    return _filtersRepository.fetchGearTypes();
  }
}
