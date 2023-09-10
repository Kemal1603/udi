import '../../domain.dart';

final class FetchFamilyUseCase extends FutureUseCase<NoParams, List<FamilyModel>> {
  final FiltersRepository _filtersRepository;

  FetchFamilyUseCase({
    required FiltersRepository filtersRepository,
  }) : _filtersRepository = filtersRepository;

  @override
  Future<List<FamilyModel>> execute(NoParams input) {
    return _filtersRepository.fetchFamilies();
  }
}
