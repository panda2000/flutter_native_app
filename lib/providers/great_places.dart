import 'package:flutter/cupertino.dart';
import 'dart:io';

import '../models/place.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById (String id) {
    return _items.firstWhere((place) => place.id == id);
  }

  void addPlaces (String peakedTitle, File pickedImage, PlaceLocation pickedLocation) {
    final newPlace  = Place (
        id: DateTime.now().toString(),
        image: pickedImage,
        title: peakedTitle,
        location: pickedLocation,
    );

    _items.add(newPlace);
    notifyListeners();

    DBHelper.insert(
        'user_places',
        {
          'id': newPlace.id,
          'title': newPlace.title,
          'image': newPlace.image.path,
          'loc_lat': newPlace.location.latitude,
          'loc_lng': newPlace.location.longitude,
        }
    );
  }

  Future <void> fetchAndSetPlaces () async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList.map((item)=>Place(
        id: item['id'],
      title: item['title'],
      image: File(item['image']),
      location: PlaceLocation(latitude: item['loc_lat'], longitude: item['loc_lng'], adress: item['adress']),
    )).toList();
  }
}