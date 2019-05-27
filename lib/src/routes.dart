import 'package:testing_app/src/pages/camera_page.dart';
import 'package:flutter/material.dart';
import 'package:testing_app/src/pages/picture_page.dart';

const HOME = '/';
const IMAGE_VIEW = "/imageView";

final Map<String, WidgetBuilder> appRoutes = {
  HOME: (context) => CameraPage(),
  IMAGE_VIEW: (context) => PicturePage()
};