import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {

  String _previewImageUrl;

  Future<void> _getCurrentLocation () async {
    final locData = await Location().getLocation();
    print (locData.latitude);
    print (locData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column (children: <Widget>[
      Container (
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        child: _previewImageUrl == null
          ? Text (
          'No location',
          textAlign: TextAlign.center,
        )
          : Image.network(
          _previewImageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
      Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        FlatButton.icon (
            icon: Icon (Icons.location_on),
            label: Text('Current Location'),
            textColor: Theme.of(context).primaryColor,
            onPressed: _getCurrentLocation,
        ),
        SizedBox (height: 10,),
        FlatButton.icon (
          icon: Icon (Icons.map),
          label: Text('Select on map'),
          textColor: Theme.of(context).primaryColor,
          onPressed: () {

          },
        ),
        SizedBox (height: 10,),
      ],),
    ],);
  }
}
