part of 'advert_details_bloc.dart';

abstract class AdvertDetailsEvent {}

class InitEvent extends AdvertDetailsEvent {
  final AdvertModel advert;

  InitEvent({
    required this.advert,
  });
}
