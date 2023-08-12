import '../../domain.dart';

final class FetchBodyTypeUseCase extends FutureUseCase<List<int>, List<BodyTypeModel>> {
  final FiltersRepository _filtersRepository;

  FetchBodyTypeUseCase({
    required FiltersRepository filtersRepository,
  }) : _filtersRepository = filtersRepository;

  @override
  Future<List<BodyTypeModel>> execute(List<int> input) {
    return _filtersRepository.fetchBodyTypes(input);
  }
}
