part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final int page;
  final FilterModel filter;
  final List<AdvertModel> adverts;

  const HomeState({
    this.isLoading = false,
    this.page = 1,
    this.filter = const FilterModel(),
    this.adverts = const <AdvertModel>[],
  });

  HomeState copyWith({
    bool? isLoading,
    int? page,
    FilterModel? filter,
    List<AdvertModel>? adverts,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      filter: filter ?? this.filter,
      page: page ?? this.page,
      adverts: adverts ?? this.adverts,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isLoading,
        page,
        filter,
        adverts,
      ];
}
