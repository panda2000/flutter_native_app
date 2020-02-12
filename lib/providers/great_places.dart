import 'package:flutter/cupertino.dart';
import 'dart:io';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlaces (String peakedTitle, File pickedImage,) {
    final newPlace  = Place (
        id: DateTime.now().toString(),
        image: pickedImage,
        title: peakedTitle,
        location: null,
    );

    _items.add(newPlace);
    notifyListeners();
  }
}