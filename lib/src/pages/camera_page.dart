import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:testing_app/src/widgets/TakePicture.dart';

class CameraPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CameraPageState();
  }
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: FutureBuilder<CameraDescription>(
        future: _setupCamera(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return TakePictureWidget(
              camera: snapshot.data,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      )
    );
  }

  Future<CameraDescription> _setupCamera() async {
    final cameras = await availableCameras();
    return cameras.first; 
  }
}