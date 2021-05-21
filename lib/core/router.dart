// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/router_constants.dart';

import 'package:flutter_recipe_app/views/home/home_view.dart' as view0;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeViewRoute:
        return MaterialPageRoute(builder: (_) => view0.HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}