import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/filter_bloc.dart';
import '../ui/filter_drawer_widget.dart';

class FilterDrawer extends StatelessWidget {
   final Function(FilterModel) onApply;

  const FilterDrawer({required this.onApply,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilterBloc>(
      create: (BuildContext context) => FilterBloc(
        fetchBrandUseCase: appLocator<FetchBrandUseCase>(),
        fetchModelUseCase: appLocator<FetchModelUseCase>(),
        fetchGenerationUseCase: appLocator<FetchGenerationUseCase>(),
      ),
      child: FilterDrawerWidget(
        onApply:  onApply,
      ),
    );
  }
}
