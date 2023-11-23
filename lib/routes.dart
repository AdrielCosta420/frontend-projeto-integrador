import 'package:routefly/routefly.dart';

import 'app/admin/admin_page.dart' as a0;
import 'app/app_page.dart' as a1;
import 'app/carros/carros_page.dart' as a2;
import 'app/carros/criar_carro_page.dart' as a3;
import 'app/login/login_page.dart' as a4;
import 'app/users/criar_usuario_page.dart' as a5;
import 'app/users/user_page.dart' as a6;

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
    key: '/carros',
    uri: Uri.parse('/carros'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.CarrosPage(),
    ),
  ),
  RouteEntity(
    key: '/carros/criar_carro',
    uri: Uri.parse('/carros/criar_carro'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.CriarCarroPage(),
    ),
  ),
  RouteEntity(
    key: '/login',
    uri: Uri.parse('/login'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a4.LoginPage(),
    ),
  ),
  RouteEntity(
    key: '/users/criar_usuario',
    uri: Uri.parse('/users/criar_usuario'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a5.CriarUsuarioPage(),
    ),
  ),
  RouteEntity(
    key: '/users/user',
    uri: Uri.parse('/users/user'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a6.UserPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  admin: '/admin',
  carros: (
    path: '/carros',
    criarCarro: '/carros/criar_carro',
  ),
  login: '/login',
  users: (
    path: '/users',
    criarUsuario: '/users/criar_usuario',
    user: '/users/user',
  ),
);
