import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../routes.dart';

class TakePictureWidget extends StatefulWidget {
  final CameraDescription camera;

  TakePictureWidget({
    Key key, 
    @required this.camera
  }) : super(key: key);

  _TakePictureWidgetState createState() => _TakePictureWidgetState();
}

class _TakePictureWidgetState extends State<TakePictureWidget> {

  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
         future: _initializeControllerFuture,
         builder: (context, snapshot) {
           if(snapshot.connectionState == ConnectionState.done) {
             return constructBody();
           } else {
             return Center(
               child: CircularProgressIndicator(),
             );
           }
         },
       );
  }


  Widget constructBody() {
    return Stack(
      children: <Widget>[
        CameraPreview(_controller),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
              child: FloatingActionButton(
                onPressed: takePicture,
                child: Icon(
                  Icons.camera
                ),
              ),  
            ),
            SizedBox(height: 10,)
          ],
        )
      ],
    );
  }

  void takePicture() async {
    try {
      await _initializeControllerFuture;
      final path = join(
        (await getTemporaryDirectory()).path,
        "coolPhoto.png"
      );
      
      await _controller.takePicture(path);
      Navigator.pushNamed(this.context, IMAGE_VIEW);
    } catch(e) {
      print(e);
    }
  }
}