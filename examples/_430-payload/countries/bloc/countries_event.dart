import 'package:equatable/equatable.dart';

// CountriesEvent: our base class for events
abstract class CountriesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Event: fetching all countries from the API
class FetchCountries extends CountriesEvent {}
