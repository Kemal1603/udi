part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<BrandModel> brands;
  final List<ModelModel> models;

  const HomeState({
    this.isLoading = false,
    this.brands = const <BrandModel>[],
    this.models = const <ModelModel>[],
  });

  HomeState copyWith({
    bool? isLoading,
    List<BrandModel>? brands,
    List<ModelModel>? models,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      brands: brands ?? this.brands,
      models: models ?? this.models,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isLoading,
        brands,
        models,
      ];
}
