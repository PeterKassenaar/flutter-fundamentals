import 'package:equatable/equatable.dart';


class CountriesState extends Equatable{
  @override
  List<Object?> get props => [];
}

// The initial state (or 'idle' state). It is called inside countries_bloc.dart
class CountriesInitial extends CountriesState {}

// Loading state, when all countries are being fetched
class CountriesLoading extends CountriesState {}

// State property to hold the successfully fetched list of countries
class CountriesLoaded extends CountriesState {
  final List countries;

  // constructor
  CountriesLoaded(this.countries);

  @override
  List<Object?> get props => [countries];
}

// Error state with error message
class CountriesError extends CountriesState {
  final String message;

  CountriesError(this.message);

  @override
  List<Object?> get props => [message];
}
