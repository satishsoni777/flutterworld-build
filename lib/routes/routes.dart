import 'package:flutter/material.dart';
import 'package:flutterworld/view/home/flutter_objective_problems.dart/flutter_objective.dart';
import 'package:flutterworld/view/home/flutter_widgets/flutter_widgets.dart';

class Routes {
  static const flutterObjective = 'flutter_objective';
  static const flutterWidgets = 'flutter_widgets';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      flutterObjective: (context) => FlutterObjectiveScreen(),
      flutterWidgets: (context) => FlutterWidgets()
    };
  }
}
