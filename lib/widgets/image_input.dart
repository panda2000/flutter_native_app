import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();

}

class _ImageInputState extends State<ImageInput> {
  File _storeImage;

  Future <void> _takePicture () async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if(imageFile == null){
      return;
    }
    setState(() {
      _storeImage = imageFile;
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(imageFile.path);
    final saveImage = await imageFile.copy('${appDir.path}/$filename');
    widget.onSelectImage(saveImage);
  }

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
            onPressed: _takePicture,
          ),
        )

      ],
    );
  }
}
