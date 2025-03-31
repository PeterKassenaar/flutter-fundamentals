import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/countries_bloc.dart';
import 'bloc/countries_state.dart';

class CountriesFavorites extends StatelessWidget {
  const CountriesFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Countries'),
        centerTitle: true,
        backgroundColor: Colors.red[800],
      ),
      // Again, we're using the BlocProvider() from main.dart. Therefore we can
      // simply use a BlocBuilder() here as its body. The Bloc and State are passed
      // from the top level widget main.dart.
      body: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoaded) {
            if (state.favorites.isEmpty) {
              return const Center(child: Text('No favorite countries yet.'));
            }
            // because this is the same ListView.builder() as in countries_home.dart, we
            // could also move this to its own widget/file.
            return ListView.builder(
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                final country = state.favorites[index];
                return ListTile(
                  leading: Image.network(
                    country['flags']['png'],
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(country['name']['common']),
                  subtitle: Text(country['capital']?.first ?? 'No capital found.'),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}