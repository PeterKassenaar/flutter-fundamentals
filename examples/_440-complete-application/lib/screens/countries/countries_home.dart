// homeCountries.dart - the Home Screen
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/countries_bloc.dart';
import 'bloc/countries_event.dart';
import 'bloc/countries_state.dart';

// 1. Because all data now lives in the state, we still use a
// StatelessWidget. There is *no more logic* in this widget
class CountriesHome extends StatelessWidget {
  const CountriesHome({super.key});

  // ************************* UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Countries'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      // 2. The body is the BlocBuilder(). Because state is used in multiple screens in
      // this application, we provide the BlocProvider() in main.dart. Look it up there!
      body: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CountriesLoaded) {
            return ListView.builder(
              itemCount: state.countries.length,
              padding: EdgeInsets.all(10.0),
              // 4. Function to build the items in the ListView
              // See https://api.flutter.dev/flutter/widgets/ListView-class.html for more info
              itemBuilder: (BuildContext context, int index) {
                // 5. The current country[index] cached in a variable
                // plus its Favorite state.
                final country = state.countries[index];
                final isFavorite = state.favorites.contains(country);

                // 6. Every list item wrapped in a Padding() widget.
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Image.network(
                          country['flags']['png'],
                          // 7. using the 'png' image from the response
                          width: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // 8. Optional: Handle when the image can't load
                            return Icon(Icons.error, size: 50);
                          },
                        ),
                        title: Text(country['name']['common']),
                        subtitle: Text(
                          country['capital']?.first ?? 'No capital found.',
                        ),
                        // 8. A trailing button to toggle the 'Favorite' state
                        trailing: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            // 9. Emit event if the Favorite state is toggled.
                            // The 'context' comes from the itemBuilder (BuildContext context, int index) above.
                            context.read<CountriesBloc>().add(
                              ToggleFavorite(country: country),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is CountriesError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
