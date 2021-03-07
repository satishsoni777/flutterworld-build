import 'package:flutter/material.dart';
import 'dart:js' as js;

class NavigatorManager {
  static void next(screen, BuildContext context) =>
      Navigator.pushNamed(context, screen);

  static void nextTab(screen, BuildContext context) {
    final currentRoute = ModalRoute.of(context).settings.name;
    print("currentRoute $screen");
    js.context.callMethod('openLink', ['$screen']);
  }

  static void pop(BuildContext context) => Navigator.pop(context);
}
