import 'package:equatable/equatable.dart';

// 1. This class represents all possible states of CountriesBloc
class CountriesState extends Equatable{
  @override
  List<Object?> get props => [];
}

// 2. The initial state (or 'idle' state). It is called inside countries_bloc.dart
class CountriesInitial extends CountriesState {}

// 3. Loading state, when all countries are being fetched
class CountriesLoading extends CountriesState {}

// State property to hold the successfully fetched list of countries.
// 4. It is now extended with a list of favorite countries.
class CountriesLoaded extends CountriesState {
  final List countries;
  final List favorites;

  // constructor, using named properties here
  CountriesLoaded({required this.countries, required this.favorites});

  // 5. When getting the state, return countries AND favorites.
  @override
  List<Object?> get props => [countries, favorites];
}

// 6. Error state with error message
class CountriesError extends CountriesState {
  final String message;

  // constructor, using a named property
  CountriesError({required this.message});

  @override
  List<Object?> get props => [message];
}
