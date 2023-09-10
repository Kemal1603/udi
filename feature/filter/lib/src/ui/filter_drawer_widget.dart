import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/filter_bloc.dart';

class FilterDrawerWidget extends StatelessWidget {
  final Function(FilterModel filter) onApply;

  const FilterDrawerWidget({
    required this.onApply,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () => context.read<FilterBloc>().add(ResetEvent()),
                  child: Text(
                    'filter.reset'.tr(),
                    style: AppFonts.normal13,
                  ),
                ),
                Text(
                  'filter.filter'.tr(),
                  style: AppFonts.bold18.copyWith(color: colors.textColor),
                ),
                IconButton(
                  onPressed: () => context.router.pop(),
                  icon: Icon(Icons.close, color: colors.iconsColor),
                ),
              ],
            ),
            const SizedBox(height: 45),
            BlocBuilder<FilterBloc, FilterState>(
              buildWhen: (FilterState previous, FilterState current) =>
                  previous.countries != current.countries,
              builder: (BuildContext context, FilterState state) {
                return AppDropDownWidget(
                  label: 'filter.country'.tr(),
                  items: state.countries.getNames,
                  onChanged: (List<String>? value) {
                    context.read<FilterBloc>().add(CountryChangedEvent(value ?? <String>[]));
                  },
                );
              },
            ),
            const SizedBox(height: 15),
            ToggleButtonRow(
              onOptionChanged: (String option) {
                context.read<FilterBloc>().add(StateCarTypeChangedEvent(option));
              },
              options: <String>[
                'filter.stateCarType.all'.tr(),
                'filter.stateCarType.used'.tr(),
                'filter.stateCarType.new'.tr(),
              ],
            ),
            const SizedBox(height: 29),
            RangeRow(
              title: 'filter.price'.tr(),
              onFromChanged: (String value) {
                context.read<FilterBloc>().add(FromPriceChangedEvent(value));
              },
              onToChanged: (String value) {
                context.read<FilterBloc>().add(ToPriceChangedEvent(value));
              },
            ),
            const SizedBox(height: 25),
            BlocBuilder<FilterBloc, FilterState>(
              buildWhen: (FilterState previous, FilterState current) =>
                  previous.brands != current.brands,
              builder: (BuildContext context, FilterState state) {
                return AppDropDownWidget(
                  hasCheckbox: true,
                  label: 'filter.brand'.tr(),
                  items: state.brands.getNames,
                  onChanged: (List<String>? value) {
                    context.read<FilterBloc>().add(BrandChangedEvent(value ?? <String>[]));
                  },
                );
              },
            ),
            const SizedBox(height: 25),
            BlocBuilder<FilterBloc, FilterState>(
              buildWhen: (FilterState previous, FilterState current) =>
                  previous.models != current.models,
              builder: (BuildContext context, FilterState state) {
                return AppDropDownWidget(
                  hasCheckbox: true,
                  label: 'filter.model'.tr(),
                  items: state.models.getNames,
                  onChanged: (List<String>? value) {
                    context.read<FilterBloc>().add(ModelChangedEvent(value ?? <String>[]));
                  },
                );
              },
            ),
            const SizedBox(height: 25),
            BlocBuilder<FilterBloc, FilterState>(
              buildWhen: (FilterState previous, FilterState current) =>
                  previous.generations != current.generations,
              builder: (BuildContext context, FilterState state) {
                return AppDropDownWidget(
                  hasCheckbox: true,
                  label: 'filter.generation'.tr(),
                  items: state.generations.getNames,
                  onChanged: (List<String>? value) {
                    context.read<FilterBloc>().add(GenerationChangedEvent(value ?? <String>[]));
                  },
                );
              },
            ),
            const SizedBox(height: 25),
            RangeRow(
              title: 'filter.year'.tr(),
              onFromChanged: (String value) {
                context.read<FilterBloc>().add(YearFromChangedEvent(value));
              },
              onToChanged: (String value) {
                context.read<FilterBloc>().add(YearToChangedEvent(value));
              },
            ),
            const SizedBox(height: 25),
            RangeRow(
              title: 'filter.mileage'.tr(),
              onFromChanged: (String value) {
                context.read<FilterBloc>().add(FromMileageChangedEvent(value));
              },
              onToChanged: (String value) {
                context.read<FilterBloc>().add(ToMileageChangedEvent(value));
              },
            ),
            const SizedBox(height: 25),
            AppCheckBoxGroup(
              title: 'filter.gearBoxType.title'.tr(),
              onChanged: (List<String> options) =>
                  context.read<FilterBloc>().add(TransmissionChangedEvent(options)),
              options: <String>[
                'filter.gearBoxType.mechanic'.tr(),
                'filter.gearBoxType.auto'.tr(),
                'filter.gearBoxType.robot'.tr(),
                'filter.gearBoxType.variator'.tr(),
              ],
            ),
            const SizedBox(height: 15),
            AppCheckBoxGroup(
              title: 'filter.engineType.title'.tr(),
              onChanged: (List<String> options) =>
                  context.read<FilterBloc>().add(EngineTypeChangedEvent(options)),
              options: <String>[
                'filter.engineType.petrol'.tr(),
                'filter.engineType.diesel'.tr(),
                'filter.engineType.gas'.tr(),
                'filter.engineType.electro'.tr(),
                'filter.engineType.hybrid'.tr(),
              ],
            ),
            const SizedBox(height: 25),
            RangeRow(
                title: 'filter.enginePower'.tr(),
                onFromChanged: (String value) {
                  context.read<FilterBloc>().add(FromEnginePowerChangedEvent(value));
                },
                onToChanged: (String value) {
                  context.read<FilterBloc>().add(ToEnginePowerChangedEvent(value));
                }),
            const SizedBox(height: 15),
            AppCheckBoxGroup(
              title: 'filter.driveType.title'.tr(),
              onChanged: (List<String> options) =>
                  context.read<FilterBloc>().add(DriveTypeChangedEvent(options)),
              options: <String>[
                'filter.driveType.front'.tr(),
                'filter.driveType.rear'.tr(),
                'filter.driveType.full'.tr(),
              ],
            ),
            const SizedBox(height: 15),
            ToggleGroupWidget(
              title: 'filter.condition.title'.tr(),
              onOptionChanged: (String option) {
                context.read<FilterBloc>().add(ConditionChangedEvent(option));
              },
              options: <String>[
                'filter.condition.all'.tr(),
                'filter.condition.withOutCrashed'.tr(),
                'filter.condition.crashed'.tr(),
              ],
            ),
            const SizedBox(height: AppDimens.PADDING_25),
            ToggleGroupWidget(
              title: 'filter.registration.title'.tr(),
              onOptionChanged: (String option) {
                context.read<FilterBloc>().add(RegistrationChangedEvent(option));
              },
              options: <String>[
                'filter.registration.all'.tr(),
                'filter.registration.withOutCustoms'.tr(),
                'filter.registration.customs'.tr(),
                'filter.registration.registration'.tr(),
                'filter.registration.withOutRegistration'.tr(),
              ],
            ),
            const SizedBox(height: AppDimens.PADDING_25),
            AppCheckBoxGroup(
              title: 'filter.bodyType.title'.tr(),
              onChanged: (List<String> options) =>
                  context.read<FilterBloc>().add(BodyTypeChangedEvent(options)),
              options: <String>[
                'filter.bodyType.sedan'.tr(),
                'filter.bodyType.hatchback'.tr(),
                'filter.bodyType.universal'.tr(),
                'filter.bodyType.coupe'.tr(),
                'filter.bodyType.cabriolet'.tr(),
                'filter.bodyType.limousine'.tr(),
                'filter.bodyType.pickup'.tr(),
                'filter.bodyType.minivan'.tr(),
                'filter.bodyType.suv'.tr(),
                'filter.bodyType.crossover'.tr(),
                'filter.bodyType.van'.tr(),
                'filter.bodyType.truck'.tr(),
                'filter.bodyType.bus'.tr(),
                'filter.bodyType.microbus'.tr(),
                'filter.bodyType.other'.tr(),
              ],
            ),
            const SizedBox(height: AppDimens.PADDING_15),
            ToggleGroupWidget(
              title: 'filter.wheelType.title'.tr(),
              onOptionChanged: (String option) {
                context.read<FilterBloc>().add(WheelTypeChangedEvent(option));
              },
              options: <String>[
                'filter.wheelType.all'.tr(),
                'filter.wheelType.left'.tr(),
                'filter.wheelType.right'.tr(),
              ],
            ),
            const SizedBox(height: AppDimens.PADDING_25),
            ToggleGroupWidget(
              title: 'filter.sellerType.title'.tr(),
              onOptionChanged: (String option) {
                context.read<FilterBloc>().add(SellerTypeChangedEvent(option));
              },
              options: <String>[
                'filter.sellerType.all'.tr(),
                'filter.sellerType.owner'.tr(),
                'filter.sellerType.dealer'.tr(),
              ],
            ),
            const SizedBox(height: AppDimens.PADDING_25),
            Text('filter.sorting.title', style: AppFonts.bold18),
            RadioButtonGroup(
              items: <String>[
                'filter.sorting.priceUp'.tr(),
                'filter.sorting.priceDown'.tr(),
                'filter.sorting.yearUp'.tr(),
                'filter.sorting.yearDown'.tr(),
                'filter.sorting.mileageUp'.tr(),
                'filter.sorting.mileageDown'.tr(),
              ],
              onItemSelected: (String value) {
                context.read<FilterBloc>().add(SortingChangedEvent(value));
              },
            ),
            const SizedBox(height: AppDimens.PADDING_45),
            AppButton(
              text: 'common.apply'.tr(),
              onPressed: () {
                onApply(context.read<FilterBloc>().state.filter);
                context.router.pop();
              },
              verticalPadding: AppDimens.PADDING_12,
              radius: AppDimens.BORDER_RADIUS_10,
            ),
            const SizedBox(height: AppDimens.PADDING_25),
          ],
        ),
      ),
    );
  }
}
