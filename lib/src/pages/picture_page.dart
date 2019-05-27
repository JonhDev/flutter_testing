import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PicturePage extends StatelessWidget {
  const PicturePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image view!"),
      ),
      body: FutureBuilder<String>(
        future: getPath(),
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return Image.file(File(snap.data));
          } else {
            CircularProgressIndicator();
          }
        },
      )
    );
  }

  Future<String> getPath() async {
    return join(
        (await getTemporaryDirectory()).path,
        "coolPhoto.png"
      );
  }
}