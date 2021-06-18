import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/pages/main.dart';
import 'package:myapp/routing/routes_names.dart';
import '../pages/billingpage.dart';
import '../pages/guidance.dart';
import '../pages/servicescategories.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case FIRST_PAGE:
      return _getPageRoute(ServicesCategories(), settings);
    case SECOND_PAGE:
      return _getPageRoute(Guidance(), settings);
    case THIRD_PAGE:
      return _getPageRoute(BillingPage(), settings);

    default:
      return _getPageRoute(MainPage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String? routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
