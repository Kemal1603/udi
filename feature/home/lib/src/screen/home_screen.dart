import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../ui/mobile/home_form_mobile.dart';
import '../ui/tablet/home_form_tablet.dart';
import '../ui/web/home_form_web.dart';

@RoutePage<String>()
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      mobileBuilder: (_) => const HomeFormMobile(),
      tabletBuilder: (_) => const HomeFormTablet(),
      desktopBuilder: (_) => const HomeFormWeb(),
    );
  }
}
