import 'package:flutter/material.dart';
import 'package:moneymietest/ui/screens/movies_list/movies_view.dart';
import 'package:moneymietest/utils/router/routeNames.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    case PostRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Movies(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
