import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'countries_event.dart';
import 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc() : super(CountriesInitial()) {
    // 1. Listen to the FetchCountries event
    on<FetchCountries>((event, emit) async {
      emit(CountriesLoading()); // emit the countries loading event.

      // 2. using the async/await notation here, therefore we can use try/catch
      try {
        final response = await http.get(Uri.parse(
            'https://restcountries.com/v3.1/all?fields=name,capital,flags'
        ));
        if(response.statusCode ==200){
          List countries = jsonDecode(response.body);
          emit(CountriesLoaded(countries)); // success. Emit CountriesLoaded() with fetched countries as payload
        }
        else{
          emit(CountriesError('Failed to fetch countries')); // error. Emit error message
        }
      }
      catch(e) {
        emit(CountriesError('An error occurred: $e')); // General error: emit message
      }
    });
  }
}
