import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';
import '../ui/mobile/home_form_mobile.dart';
import '../ui/tablet/home_form_tablet.dart';
import '../ui/web/home_form_web.dart';

@RoutePage<String>()
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(
        fetchAdvertsUseCase: appLocator<FetchAdvertUseCase>(),
        appRouter: appLocator<AppRouter>(),
      ),
      child: BaseScreen(
        mobileBuilder: (_) => HomeFormMobile(),
        tabletBuilder: (_) => const HomeFormTablet(),
        desktopBuilder: (_) => const HomeFormWeb(),
      ),
    );
  }
}
