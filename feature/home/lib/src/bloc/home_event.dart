part of 'home_bloc.dart';

abstract class HomeEvent {}

class InitEvent extends HomeEvent {}

class RefreshEvent extends HomeEvent {}

class LoadMoreEvent extends HomeEvent {}

class FilterEvent extends HomeEvent {
  final FilterModel filter;

  FilterEvent({required this.filter});
}

class OpenAdvertEvent extends HomeEvent {
  final AdvertModel advert;

  OpenAdvertEvent({required this.advert});
}
