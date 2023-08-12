import '../../domain.dart';

final class FetchGenerationUseCase extends FutureUseCase<List<int>, List<GenerationModel>> {
  final FiltersRepository _filtersRepository;

  FetchGenerationUseCase({
    required FiltersRepository filtersRepository,
  }) : _filtersRepository = filtersRepository;

  @override
  Future<List<GenerationModel>> execute(List<int> input) {
    return _filtersRepository.fetchGeneration(input);
  }
}
