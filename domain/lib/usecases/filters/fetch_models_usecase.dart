import '../../domain.dart';

final class FetchModelUseCase extends FutureUseCase<List<int>, List<ModelModel>> {
  final FiltersRepository _filtersRepository;

  FetchModelUseCase({
    required FiltersRepository filtersRepository,
  }) : _filtersRepository = filtersRepository;

  @override
  Future<List<ModelModel>> execute(List<int> input) {
    return _filtersRepository.fetchModels(input);
  }
}
