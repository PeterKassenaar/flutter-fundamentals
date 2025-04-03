import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'countries_event.dart';
import 'countries_state.dart';


class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc() : super(CountriesInitial()) {
    // 1. Listen to the FetchCountries event.
    // WORKSHOP: extract these inline functions to their own functions so we
    // only have a list on<EventName> elements in this CountriesBloc(). This
    // is functionally the same, but makes it more cleaner.
    on<FetchCountries>((event, emit) async {
      emit(CountriesLoading()); // emit the countries loading event.

      // 2. using the async/await notation here, therefore we can use try/catch
      try {
        final response = await http.get(
          Uri.parse(
            'https://restcountries.com/v3.1/all?fields=name,capital,flags',
          ),
        );
        if (response.statusCode == 200) {
          List countries = jsonDecode(response.body);
          // 3. Put all countries in the state, none of the countries is currently favorited
          // In real life, of course read the data from a db.
          emit(
            CountriesLoaded(countries: countries, favorites: []),
          ); // success. Emit CountriesLoaded() with fetched countries as payload
        } else {
          emit(
            CountriesError(message: 'Failed to fetch countries'),
          ); // error. Emit error message
        }
      } catch (e) {
        emit(
          CountriesError(message: 'An error occurred: $e'),
        ); // General error: emit message
      }
    });

    // 4. Listen to the ToggleFavorite event
    on<ToggleFavorite>((event, emit){
      if (state is CountriesLoaded) {
        final currentState = state as CountriesLoaded;
        final favorites = List<Map<String, dynamic>>.from(currentState.favorites);

        // 5. Check if the country exists by using .any() and comparing the Common Name.
        // In other applications you would use an ID or Primary Key, or the like (but in
        // this API the common name is the unique element in a country. It doesn't have an ID).
        final bool existingCountry = favorites.any(
              (country) =>
          country['name']['common'] == event.country['name']['common'],
        );

        // 6. Toggle favorite
        if (existingCountry != false) {
          favorites.remove(event.country); // Remove from favorites
        } else {
          favorites.add(event.country); // Add to favorites
        }

        // 7. Emit new state
        emit(
          CountriesLoaded(
            countries: currentState.countries,
            favorites: favorites,
          ),
        );
      }
    });
  }
}
