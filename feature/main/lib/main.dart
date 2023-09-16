library main;

import 'package:auto_route/auto_route.dart';

import 'main.gm.dart';

export 'main.gm.dart';
export 'src/ui/main_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form,Route')
class MainModule extends $MainModule {}
