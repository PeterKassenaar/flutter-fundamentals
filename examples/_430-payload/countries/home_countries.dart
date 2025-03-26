// homeCountries.dart - the Home Screen
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/countries_bloc.dart';
import 'bloc/countries_event.dart';
import 'bloc/countries_state.dart';

// Because all data now lives in the state, we can use a
// StatelessWidget. There is *no more logic* in this widget
class Homecountries extends StatelessWidget {
  const Homecountries({super.key});

  // ************************* UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Countries'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      // The body is now the BlocProvider(). We could also have used this in main.dart.
      body: BlocProvider(
        create:
            (context) =>
                CountriesBloc()..add(
                  FetchCountries(),
                ), // Automatically fetch countries on load, using the cascade operator (..).
        child: BlocBuilder<CountriesBloc, CountriesState>(
          builder: (context, state) {
            if (state is CountriesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CountriesLoaded) {
              return ListView.builder(
                itemCount: state.countries.length,
                padding: EdgeInsets.all(10.0),
                // Function to build the items in the ListView
                // See https://api.flutter.dev/flutter/widgets/ListView-class.html for more info
                itemBuilder: (BuildContext context, int index) {
                  final country = state.countries[index];
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Image.network(
                            country['flags']['png'],
                            // using the 'png' image from the response
                            width: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              // Optional: Handle when the image can't load
                              return Icon(Icons.error, size: 50);
                            },
                          ),
                          title: Text(country['name']['common']),
                          subtitle: Text(
                            country['capital']?.first ?? 'No capital found.',
                          ),
                          // Optional: retrieve and use more properties
                          // Next up: adding onTap: to do something with the country,
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
      ),
    );
  }
}
