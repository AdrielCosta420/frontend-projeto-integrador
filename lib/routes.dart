import 'package:routefly/routefly.dart';

import 'app/admin/admin_page.dart' as a0;
import 'app/app_page.dart' as a1;
import 'app/login/login_page.dart' as a2;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/admin',
    uri: Uri.parse('/admin'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.AdminPage(),
    ),
  ),
  RouteEntity(
    key: '/',
    uri: Uri.parse('/'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.AppPage(),
    ),
  ),
  RouteEntity(
    key: '/login',
    uri: Uri.parse('/login'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.LoginPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  admin: '/admin',
  login: '/login',
);