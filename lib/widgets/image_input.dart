import 'package:flutter/material.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storeImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storeImage != null
              ? Image.file(
                  _storeImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text ('No image', textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10,),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text ('Take a picture'),
            textColor: Theme.of(context).primaryColor,
            onPressed: () {

            },
          ),
        )

      ],
    );
  }
}
