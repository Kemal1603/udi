import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/advert_details_bloc.dart';
import '../ui/mobile/advert_details_form_mobile.dart';

@RoutePage<String>()
class AdvertDetailsScreen extends StatelessWidget {
  final AdvertModel advert;

  const AdvertDetailsScreen({
    required this.advert,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdvertDetailsBloc>(
      create: (BuildContext context) => AdvertDetailsBloc()
        ..add(
          InitEvent(advert: advert),
        ),
      child: BaseScreen(
        mobileBuilder: (_) => AdvertDetailsMobile(),
      ),
    );
  }
}
