import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchBrandUseCase _fetchBrandUseCase;
  final FetchModelUseCase _fetchModelUseCase;
  final FetchGenerationUseCase _fetchGenerationUseCase;

  HomeBloc({
    required FetchBrandUseCase fetchBrandUseCase,
    required FetchModelUseCase fetchModelUseCase,
    required FetchGenerationUseCase fetchGenerationUseCase,
  })  : _fetchBrandUseCase = fetchBrandUseCase,
        _fetchModelUseCase = fetchModelUseCase,
        _fetchGenerationUseCase = fetchGenerationUseCase,
        super(const HomeState()) {
    on<InitEvent>(_onInit);
    on<FetchModelsEvent>(_onFetchModels);
    on<FetchGenerationsEvent>(_onFetchGenerations);

    add(InitEvent());
  }

  Future<void> _onInit(InitEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    final List<BrandModel> brands = await _fetchBrandUseCase.execute(const NoParams());
    emit(
      state.copyWith(
        brands: brands,
        isLoading: false,
      ),
    );
  }

  Future<void> _onFetchModels(FetchModelsEvent event, Emitter<HomeState> emit) async {
    final List<ModelModel> models = await _fetchModelUseCase.execute(event.brandsIDs);
    emit(state.copyWith(models: models));
  }

  Future<void> _onFetchGenerations(FetchGenerationsEvent event, Emitter<HomeState> emit) async {
    final List<GenerationModel> generations =
        await _fetchGenerationUseCase.execute(event.modelsIDs);
    emit(state.copyWith(generations: generations));
  }
}
