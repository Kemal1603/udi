import '../../domain.dart';

final class FetchAdvertUseCase extends FutureUseCase<AdvertRequest, List<AdvertModel>> {
  final FiltersRepository _filtersRepository;

  FetchAdvertUseCase({
    required FiltersRepository filtersRepository,
  }) : _filtersRepository = filtersRepository;

  @override
  Future<List<AdvertModel>> execute(AdvertRequest input) {
    return _filtersRepository.fetchAdverts(input);
  }
}
