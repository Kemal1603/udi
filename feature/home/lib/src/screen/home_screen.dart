import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecases/filters/fetch_brand_usecase.dart';
import 'package:domain/usecases/filters/fetch_models_usecase.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';
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
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(
        fetchBrandUseCase: appLocator<FetchBrandUseCase>(),
        fetchModelUseCase: appLocator<FetchModelUseCase>(),
      ),
      child: BaseScreen(
        mobileBuilder: (_) => const HomeFormMobile(),
        tabletBuilder: (_) => const HomeFormTablet(),
        desktopBuilder: (_) => const HomeFormWeb(),
      ),
    );
  }
}
