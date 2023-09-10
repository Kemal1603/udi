import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchAdvertUseCase _fetchAdvertsUseCase;

  HomeBloc({
    required FetchAdvertUseCase fetchAdvertsUseCase,
  })  : _fetchAdvertsUseCase = fetchAdvertsUseCase,
        super(const HomeState()) {
    on<InitEvent>(_onInit);

    on<RefreshEvent>(_onRefreshEvent);
    on<LoadMoreEvent>(_onLoadMoreEvent);
    on<FilterEvent>(_onFilterEvent);

    add(InitEvent());
  }

  Future<void> _onInit(InitEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(isLoading: false, adverts: await _loadAdverts(state.page)));
  }

  Future<void> _onRefreshEvent(RefreshEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(isLoading: false, adverts: await _loadAdverts(1)));
  }

  Future<void> _onLoadMoreEvent(LoadMoreEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(isLoading: false, adverts: await _loadAdverts(state.page + 1)));
  }

  Future<void> _onFilterEvent(FilterEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, filter: event.filter));
    emit(state.copyWith(isLoading: false, adverts: await _loadAdverts(1)));
  }

  Future<List<AdvertModel>> _loadAdverts(int page) {
    return _fetchAdvertsUseCase.execute(
      state.filter.toAdvertRequest(page: state.page),
    );
  }
}
