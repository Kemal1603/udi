import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final FetchBrandUseCase _fetchBrandUseCase;
  final FetchModelUseCase _fetchModelUseCase;
  final FetchGenerationUseCase _fetchGenerationUseCase;

  FilterBloc({
    required FetchBrandUseCase fetchBrandUseCase,
    required FetchModelUseCase fetchModelUseCase,
    required FetchGenerationUseCase fetchGenerationUseCase,
  })  : _fetchBrandUseCase = fetchBrandUseCase,
        _fetchModelUseCase = fetchModelUseCase,
        _fetchGenerationUseCase = fetchGenerationUseCase,
        super(FilterState()) {
    on<FilterEvent>(_onFilterEvent);
    on<InitEvent>(_onInitEvent);
    on<ResetEvent>(_onResetEvent);
    on<CountryChangedEvent>(_onCountryChangedEvent);
    on<StateCarTypeChangedEvent>(_onStateCarTypeChangedEvent);
    on<FromPriceChangedEvent>(_onFromPriceChangedEvent);
    on<ToPriceChangedEvent>(_onToPriceChangedEvent);
    on<BrandChangedEvent>(_onBrandChangedEvent);
    on<ModelChangedEvent>(_onModelChangedEvent);
    on<GenerationChangedEvent>(_onGenerationChangedEvent);
    on<YearFromChangedEvent>(_onYearFromChangedEvent);
    on<YearToChangedEvent>(_onYearToChangedEvent);
    on<TransmissionChangedEvent>(_onTransmissionChangedEvent);
    on<FromMileageChangedEvent>(_onFromMileageChangedEvent);
    on<ToMileageChangedEvent>(_onToMileageChangedEvent);
    on<EngineTypeChangedEvent>(_onEngineTypeChangedEvent);
    on<FromEnginePowerChangedEvent>(_onFromEnginePowerChangedEvent);
    on<ToEnginePowerChangedEvent>(_onToEnginePowerChangedEvent);
    on<DriveTypeChangedEvent>(_onDriveTypeChangedEvent);
    on<ConditionChangedEvent>(_onConditionChangedEvent);
    on<RegistrationChangedEvent>(_onRegistrationChangedEvent);
    on<BodyTypeChangedEvent>(_onBodyTypeChangedEvent);
    on<WheelTypeChangedEvent>(_onWheelTypeChangedEvent);
    on<SellerTypeChangedEvent>(_onSellerTypeChangedEvent);
    on<SortingChangedEvent>(_onSortingChangedEvent);

    add(InitEvent());
  }

  Future<void> _onFilterEvent(
    FilterEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onInitEvent(
    InitEvent event,
    Emitter<FilterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final List<BrandModel> brands = await _fetchBrandUseCase.execute(const NoParams());
    emit(
      state.copyWith(
        brands: brands,
        isLoading: false,
      ),
    );
  }

  Future<void> _onResetEvent(
    ResetEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onCountryChangedEvent(
    CountryChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onStateCarTypeChangedEvent(
    StateCarTypeChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onFromPriceChangedEvent(
    FromPriceChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onToPriceChangedEvent(
    ToPriceChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onBrandChangedEvent(
    BrandChangedEvent event,
    Emitter<FilterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final List<BrandModel> brands =
        state.brands.where((BrandModel element) => event.brand.contains(element.name)).toList();
    final List<ModelModel> models = await _fetchModelUseCase.execute(brands.getIds);
    emit(
      state.copyWith(
        models: models,
        isLoading: false,
        filter: state.filter.copyWith(
          brandIDs: brands.getIds,
        ),
      ),
    );
  }

  Future<void> _onModelChangedEvent(
    ModelChangedEvent event,
    Emitter<FilterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final List<ModelModel> models =
        state.models.where((ModelModel element) => event.model.contains(element.name)).toList();
    final List<GenerationModel> generations = await _fetchGenerationUseCase.execute(models.getIds);
    emit(
      state.copyWith(
        generations: generations,
        isLoading: false,
        filter: state.filter.copyWith(
          modelIDs: models.getIds,
        ),
      ),
    );
  }

  Future<void> _onGenerationChangedEvent(
    GenerationChangedEvent event,
    Emitter<FilterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final List<GenerationModel> generations = state.generations
        .where((GenerationModel element) => event.generation.contains(element.name))
        .toList();
    emit(
      state.copyWith(
        isLoading: false,
        filter: state.filter.copyWith(
          generationIDs: generations.getIds,
        ),
      ),
    );
  }

  Future<void> _onYearFromChangedEvent(
    YearFromChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onYearToChangedEvent(
    YearToChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onTransmissionChangedEvent(
    TransmissionChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onFromMileageChangedEvent(
    FromMileageChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onToMileageChangedEvent(
    ToMileageChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onEngineTypeChangedEvent(
    EngineTypeChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onFromEnginePowerChangedEvent(
    FromEnginePowerChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onToEnginePowerChangedEvent(
    ToEnginePowerChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onDriveTypeChangedEvent(
    DriveTypeChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onConditionChangedEvent(
    ConditionChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onRegistrationChangedEvent(
    RegistrationChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onBodyTypeChangedEvent(
    BodyTypeChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onWheelTypeChangedEvent(
    WheelTypeChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onSellerTypeChangedEvent(
    SellerTypeChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}

  Future<void> _onSortingChangedEvent(
    SortingChangedEvent event,
    Emitter<FilterState> emit,
  ) async {}
}
