import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../bloc/advert_details_bloc.dart';

class AdvertDetailsMobile extends StatelessWidget {
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
              vertical: AppDimens.PADDING_15,
            ),
            children: <Widget>[
              AppGalleryWidget(imageUrls: state.advert.imageUrls),
              const SizedBox(
                height: AppDimens.PADDING_10,
              ),
              const AppDivider(),
              const SizedBox(
                height: AppDimens.PADDING_10,
              ),
              const SizedBox(
                height: AppDimens.PADDING_10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_10),
                child: Text(
                  'advertDetails.characteristics'.tr(),
                  style: AppFonts.normal16.copyWith(color: AppColors.of(context).textColor),
                ),
              ),
              const SizedBox(
                height: AppDimens.PADDING_10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (state.advert.dateOfIssue.isNotEmpty) ...<Widget>[
                      Text(
                        '${'advertDetails.year'.tr()}: ${state.advert.dateOfIssue}',
                        style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
                        softWrap: true,
                      ),
                    ],
                    if (state.advert.bodyTypeName.isNotEmpty) ...<Widget>[
                      Text(
                        '${'advertDetails.bodyType'.tr()}: ${state.advert.bodyTypeName}',
                        style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
                        softWrap: true,
                      ),
                    ],
                    if (state.advert.fuelName.isNotEmpty) ...<Widget>[
                      Text(
                        '${'advertDetails.engineType'.tr()}: ${state.advert.fuelName}',
                        style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
                        softWrap: true,
                      ),
                    ],
                    if (state.advert.motorPower.isNotEmpty) ...<Widget>[
                      Text(
                        '${'advertDetails.enginePower'.tr()}: ${state.advert.motorPower} л.с.',
                        style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
                        softWrap: true,
                      ),
                    ],
                    if (state.advert.gearName.isNotEmpty) ...<Widget>[
                      Text(
                        '${'advertDetails.gearBoxType'.tr()}: ${state.advert.gearName}',
                        style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
                        softWrap: true,
                      ),
                    ],
                    Text(
                      '${'advertDetails.mileage'.tr()}: ${state.advert.millage} км',
                      style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppDimens.PADDING_10,
              ),
              const AppDivider(),
              const SizedBox(
                height: AppDimens.PADDING_10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_10),
                child: Text(
                  'advertDetails.description'.tr(),
                  style: AppFonts.normal16.copyWith(color: AppColors.of(context).textColor),
                ),
              ),
              const SizedBox(
                height: AppDimens.PADDING_10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_20),
                child: Text(
                  'state.advert.description',
                  style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
                  softWrap: true,
                ),
              ),
              const SizedBox(
                height: AppDimens.PADDING_25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_20),
                child: Column(
                  children: <Widget>[
                    AppButton(
                      text: 'advertDetails.checkByVIN'.tr(),
                    ),
                    const SizedBox(
                      height: AppDimens.PADDING_10,
                    ),
                    AppButton(
                      text: 'advertDetails.orderCheckCar'.tr(),
                    ),
                    const SizedBox(
                      height: AppDimens.PADDING_10,
                    ),
                    AppButton(
                      text: 'advertDetails.contactWithSeller'.tr(),
                    ),
                    const SizedBox(
                      height: AppDimens.PADDING_10,
                    ),
                    AppButton(
                      text: 'advertDetails.reserveCar'.tr(),
                    ),
                    const SizedBox(
                      height: AppDimens.PADDING_10,
                    ),
                    AppButton(
                      text: 'advertDetails.orderBuyAndDelivery'.tr(),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
