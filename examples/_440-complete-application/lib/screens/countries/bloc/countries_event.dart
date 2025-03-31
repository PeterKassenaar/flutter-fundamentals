import 'package:equatable/equatable.dart';

// 1. CountriesEvent: our base class for events
abstract class CountriesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// 2. Event: fetching all countries from the API
class FetchCountries extends CountriesEvent {}

// 3. Event: marking a country as Favorite. The list consists
// of a Map<String, dynamic>, containing a list of favorite countries.
class ToggleFavorite extends CountriesEvent {
  final Map<String, dynamic>country;

  ToggleFavorite({required this.country});

  @override
  List<Object?> get props => [country];
}
