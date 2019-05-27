import 'package:flutter/material.dart';
import 'package:testing_app/src/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Camera",
      initialRoute: HOME,
      routes: appRoutes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.blue.shade900,
        appBarTheme: AppBarTheme(
          color: Colors.blue.shade900
        )
      ),
    );
  }
}