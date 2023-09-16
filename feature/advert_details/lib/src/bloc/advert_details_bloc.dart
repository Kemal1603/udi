import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

part 'advert_details_event.dart';
part 'advert_details_state.dart';

class AdvertDetailsBloc extends Bloc<AdvertDetailsEvent, AdvertDetailsState> {
  AdvertDetailsBloc()
      : super(AdvertDetailsState(
          advert: AdvertModel.empty(),
        )) {
    on<InitEvent>(_onInit);
  }

  Future<void> _onInit(InitEvent event, Emitter<AdvertDetailsState> emit) async {
    emit(
      state.copyWith(
        advert: event.advert,
        isLoading: false,
      ),
    );
  }
}
