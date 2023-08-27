part of 'home_bloc.dart';

abstract class HomeEvent {}

class InitEvent extends HomeEvent {}

class FetchModelsEvent extends HomeEvent {
  final List<int> brandsIDs;

  FetchModelsEvent({required this.brandsIDs});
}
