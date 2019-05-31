import 'dart:io';
import 'package:flutter/material.dart';

class PicturePage extends StatelessWidget {

  final String path;
  final String geoLocation;

  const PicturePage({Key key, this.path, this.geoLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo')),
      body: Column(
        children: <Widget>[
          Text(geoLocation),
          Image.file(File(path))
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}