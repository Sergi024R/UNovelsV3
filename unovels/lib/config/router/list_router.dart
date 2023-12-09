import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../view/screens/home_screen.dart';
import '../../view/screens/user_info.dart';


final List<RouteBase> routes = [
  GoRoute(
    path: '/home',
    name: HomeScreen.screenName,
    builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/user_info',
    name: UserInfo.screenName,
    builder: (BuildContext context, GoRouterState state) => UserInfo(),
  ),
  // GoRoute(
  //   path: '/',
  //   name: SplashScreen.screenName,
  //   builder: (BuildContext context, GoRouterState state) =>
  //       const SplashScreen(),
  // ),

  // GoRoute(
  //   path: '/categorias',
  //   name: categoriasscreen.screenName,
  //   builder: (BuildContext context, GoRouterState state) =>
  //       const ButtonsScreen(),
  // ),
];
