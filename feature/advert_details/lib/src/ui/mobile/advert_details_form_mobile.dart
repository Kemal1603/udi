import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../bloc/advert_details_bloc.dart';

class AdvertDetailsMobile extends StatelessWidget {
  AdvertDetailsMobile();

  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BlocBuilder<AdvertDetailsBloc, AdvertDetailsState>(
        buildWhen: (AdvertDetailsState previous, AdvertDetailsState current) {
          return previous.advert != current.advert;
        },
        builder: (BuildContext context, AdvertDetailsState state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${state.advert.brandName} ${state.advert.modelName} ${state.advert.generationName}',
                style: AppFonts.normal16.copyWith(color: AppColors.of(context).textColor),
              ),
              Text(
                '${state.advert.price}',
                style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
              ),
            ],
          );
        },
      )),
      body: BlocBuilder<AdvertDetailsBloc, AdvertDetailsState>(
        builder: (BuildContext context, AdvertDetailsState state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.PADDING_20,
              vertical: AppDimens.PADDING_15,
            ),
            children: <Widget>[
              ImageSlider(
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.aspectRatio * 500,
                imageUrls: state.advert.imageUrls,
              ),
            ],
          );
        },
      ),
    );
  }
}
