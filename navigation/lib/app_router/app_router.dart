import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:home/home.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    CustomRoute<String>(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400,
      path: '/',
      name: 'HomeRoute',
      page: HomeScreen,
      initial: true,
      children: <AutoRoute>[],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
