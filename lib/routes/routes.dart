import 'package:flutter/material.dart';
import 'package:flutterworld/modules/home/flutter_objective_problems.dart/flutter_objective.dart';
import 'package:flutterworld/modules/home/flutter_widgets/flutter_widgets.dart';
import 'package:flutterworld/modules/home/home_page.dart';
import 'package:flutterworld/routes/page_transistion_builder.dart';


class Routes {
  static const flutterObjective = 'flutter_objective';
  static const flutterWidgets = 'flutter_widgets';
  static const defaultRoute = '/';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      flutterObjective: (context) => FlutterObjectiveScreen(),
      // flutterWidgets: (context) => FlutterWidgets(),
    };
  }

  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.defaultRoute:
        return PageTransitionBuilder(
          settings: settings,
            transitionType: TransitionType.fadeTransition, widget: HomePage());
      case Routes.flutterWidgets:
        return PageTransitionBuilder( settings: settings,
            transitionType: TransitionType.fadeTransition,
            widget: FlutterWidgets());

      default:
        return null;
    }
  }
}
