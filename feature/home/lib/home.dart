library home;

import 'package:auto_route/auto_route.dart';

import 'home.gm.dart';

export 'home.gm.dart';
export 'src/screen/home_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form,Route')
class HomeModule extends $HomeModule {}
