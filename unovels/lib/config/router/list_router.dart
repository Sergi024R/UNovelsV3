import 'package:flutter_firebase/view/screens/home_screen.dart';
import 'package:flutter_firebase/view/screens/user_info.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';


final List<RouteBase> routes = [
  GoRoute(
    path: '/home',
    name: HomeScreen.screenName,
    builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/user_info',
    name: UserInfo.screenName,
    builder: (BuildContext context, GoRouterState state) => const UserInfo(),
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
