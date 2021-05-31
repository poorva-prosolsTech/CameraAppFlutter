import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pPath;
import 'package:provider/provider.dart';
import '../models/picture.dart';
import '../providers/pictures.dart';

class TakePicScreen extends StatefulWidget {
  static const routeName = '/take-pic';

  @override
  _TakePicScreenState createState() => _TakePicScreenState();
}

class _TakePicScreenState extends State<TakePicScreen> {
  File _takenImage;
  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _takenImage = imageFile;
      if (_takenImage != null) {
        Fluttertoast.showToast(msg: "Image Uploaded Successfully !!");
      }
    });
    final appDir = await pPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');

    var _imageToStore = Picture(picName: savedImage);
    _storeImage() {
      Provider.of<Pictures>(context, listen: false).storeImage(_imageToStore);
    }

    _storeImage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: FlatButton.icon(
                icon: Icon(
                  Icons.photo_camera,
                  size: 100,
                ),
                label: Text(''),
                textColor: Theme.of(context).primaryColor,
                onPressed: _takePicture,
              ),
            ),
            Text(
              'Tap to Click !!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
