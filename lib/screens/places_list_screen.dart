import 'package:flutter/material.dart';
import 'package:flutter_native_app/providers/great_places.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';

class PlaceListScreen extends StatelessWidget {

  static const String routeName = "/place_list_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center (
          child: const Text ('Got no places. Add some!'),
        ),
        builder: (ctx,greatPlaces, ch) => greatPlaces.items.length <= 0 ? ch : ListView.builder(
          itemCount: greatPlaces.items.length,
          itemBuilder: (ctx, i) => ListTile (
            leading: CircleAvatar (
              backgroundImage: FileImage (greatPlaces.items[i].image),
            ),
            title: Text(greatPlaces.items[i].title),
            onTap: () {
              // go to detail page ...
            },
          ),
        ),
      ),
    );
  }
}
