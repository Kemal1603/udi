part of 'filter_bloc.dart';

class FilterState {
  final bool isLoading;
  final FilterModel filter;
  final List<CountryModel> countries;
  final List<BrandModel> brands;
  final List<ModelModel> models;
  final List<GenerationModel> generations;

  FilterState({
    this.isLoading = false,
    this.filter = const FilterModel(),
    this.countries = const <CountryModel>[],
    this.brands = const <BrandModel>[],
    this.models = const <ModelModel>[],
    this.generations = const <GenerationModel>[],
  });

  FilterState copyWith({
    bool? isLoading,
    FilterModel? filter,
    List<CountryModel>? countries,
    List<BrandModel>? brands,
    List<ModelModel>? models,
    List<GenerationModel>? generations,
  }) {
    return FilterState(
      isLoading: isLoading ?? this.isLoading,
      filter: filter ?? this.filter,
      countries: countries ?? this.countries,
      brands: brands ?? this.brands,
      models: models ?? this.models,
      generations: generations ?? this.generations,
    );
  }
}
