import 'package:flutter/material.dart';
import 'package:flutterworld/routes/routes.dart';
import 'package:flutterworld/style/style.dart';
import 'package:flutterworld/view/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter World',
      theme: Themes.appThemeLight(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoutes()
    );
  }
}
