import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';

class PlaceDetailsScreen extends StatelessWidget {
  static const routeName = '/place-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace = Provider.of<GreatPlaces>(context, listen: false).findById(id);
    return Scaffold (
      appBar: AppBar (
        title: Text (selectedPlace.title),
      ),
      body: Column (
        children: <Widget>[
          Container (
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedPlace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 10,),
          Text (selectedPlace.location.longitude.toString()),
          Text (selectedPlace.location.latitude.toString()),
        ],
      ),
    );
  }
}
