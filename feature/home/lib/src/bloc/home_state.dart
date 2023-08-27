part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<BrandModel> brands;
  final List<ModelModel> models;
  final List<GenerationModel> generations;

  const HomeState({
    this.isLoading = false,
    this.brands = const <BrandModel>[],
    this.models = const <ModelModel>[],
    this.generations = const <GenerationModel>[],
  });

  HomeState copyWith({
    bool? isLoading,
    List<BrandModel>? brands,
    List<ModelModel>? models,
    List<GenerationModel>? generations,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      brands: brands ?? this.brands,
      models: models ?? this.models,
      generations: generations ?? this.generations,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isLoading,
        brands,
        models,
        generations,
      ];
}
