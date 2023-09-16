part of 'advert_details_bloc.dart';

class AdvertDetailsState {
  final AdvertModel advert;
  final bool isLoading;

  AdvertDetailsState({
    required this.advert,
    this.isLoading = true,
  });

  AdvertDetailsState copyWith({
    AdvertModel? advert,
    bool? isLoading,
  }) {
    return AdvertDetailsState(
      advert: advert ?? this.advert,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
