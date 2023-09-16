import 'package:advert_details/advert_details.dart';
import 'package:auto_route/auto_route.dart';
import 'package:home/home.dart';
import 'package:main/main.dart';

export 'package:advert_details/advert_details.dart';
export 'package:auto_route/auto_route.dart';
export 'package:home/home.dart';
export 'package:main/main.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  modules: [
    MainModule,
    HomeModule,
    AdvertDetailsModule,
  ],
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400,
      page: MainRoute.page,
      initial: true,
      path: '/',
      children: [
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 400,
          page: HomeRoute.page,
          initial: true,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 400,
          page: AdvertDetailsRoute.page,
        ),
      ],
    ),
  ];
}
