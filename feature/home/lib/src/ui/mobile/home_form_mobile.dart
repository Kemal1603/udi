import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:filter/filter.dart';
import 'package:flutter/material.dart';
import 'package:home/src/ui/mobile/widgets/item_widget.dart';

import '../../bloc/home_bloc.dart';

class HomeFormMobile extends StatelessWidget {
  HomeFormMobile();

  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: AppColors.of(context).transparent,
      drawer: FilterDrawer(onApply: (FilterModel filterModel) {
        context.read<HomeBloc>().add(FilterEvent(filter: filterModel));
      }),
      appBar: AppBar(
        title: const Text('CAR BY'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SmartRefresher(
            enablePullUp: true,
            controller: _refreshController,
            onRefresh: () => context.read<HomeBloc>().add(RefreshEvent()),
            onLoading: () => context.read<HomeBloc>().add(LoadMoreEvent()),
            child: ListView.builder(
              itemCount: state.adverts.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemWidget(
                  advertItem: state.adverts[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
