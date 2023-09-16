library advert_details;

import 'package:auto_route/auto_route.dart';

import 'advert_details.gm.dart';

export 'advert_details.gm.dart';
export 'src/screen/advert_details_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form,Route')
class AdvertDetailsModule extends $AdvertDetailsModule {}
