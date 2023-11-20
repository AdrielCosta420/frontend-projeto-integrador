import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:routefly/routefly.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.login,
      ),
    );
  }
}
