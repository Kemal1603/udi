part of 'filter_bloc.dart';

abstract class FilterEvent {}

class InitEvent extends FilterEvent {}

class ResetEvent extends FilterEvent {}

class CountryChangedEvent extends FilterEvent {
  final List<String> country;

  CountryChangedEvent(this.country);
}

class StateCarTypeChangedEvent extends FilterEvent {
  final String stateCarType;

  StateCarTypeChangedEvent(this.stateCarType);
}

class FromPriceChangedEvent extends FilterEvent {
  final String fromPrice;

  FromPriceChangedEvent(this.fromPrice);
}

class ToPriceChangedEvent extends FilterEvent {
  final String toPrice;

  ToPriceChangedEvent(this.toPrice);
}

class BrandChangedEvent extends FilterEvent {
  final List<String> brand;

  BrandChangedEvent(this.brand);
}

class ModelChangedEvent extends FilterEvent {
  final List<String> model;

  ModelChangedEvent(this.model);
}

class GenerationChangedEvent extends FilterEvent {
  final List<String> generation;

  GenerationChangedEvent(this.generation);
}

class YearFromChangedEvent extends FilterEvent {
  final String yearFrom;

  YearFromChangedEvent(this.yearFrom);
}

class YearToChangedEvent extends FilterEvent {
  final String yearTo;

  YearToChangedEvent(this.yearTo);
}

class TransmissionChangedEvent extends FilterEvent {
  final List<String> transmission;

  TransmissionChangedEvent(this.transmission);
}

class FromMileageChangedEvent extends FilterEvent {
  final String mileageFrom;

  FromMileageChangedEvent(this.mileageFrom);
}

class ToMileageChangedEvent extends FilterEvent {
  final String mileageTo;

  ToMileageChangedEvent(this.mileageTo);
}

class EngineTypeChangedEvent extends FilterEvent {
  final List<String> engineType;

  EngineTypeChangedEvent(this.engineType);
}

class FromEnginePowerChangedEvent extends FilterEvent {
  final String enginePowerFrom;

  FromEnginePowerChangedEvent(this.enginePowerFrom);
}

class ToEnginePowerChangedEvent extends FilterEvent {
  final String enginePowerTo;

  ToEnginePowerChangedEvent(this.enginePowerTo);
}

class DriveTypeChangedEvent extends FilterEvent {
  final List<String> driveType;

  DriveTypeChangedEvent(this.driveType);
}

class ConditionChangedEvent extends FilterEvent {
  final String condition;

  ConditionChangedEvent(this.condition);
}

class RegistrationChangedEvent extends FilterEvent {
  final String registration;

  RegistrationChangedEvent(this.registration);
}

class BodyTypeChangedEvent extends FilterEvent {
  final List<String> bodyType;

  BodyTypeChangedEvent(this.bodyType);
}

class WheelTypeChangedEvent extends FilterEvent {
  final String wheelType;

  WheelTypeChangedEvent(this.wheelType);
}

class SellerTypeChangedEvent extends FilterEvent {
  final String sellerType;

  SellerTypeChangedEvent(this.sellerType);
}

class SortingChangedEvent extends FilterEvent {
  final String sorting;

  SortingChangedEvent(this.sorting);
}
