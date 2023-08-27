import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../bloc/home_bloc.dart';

class HomeFormMobile extends StatelessWidget {
  const HomeFormMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        return Scaffold(
          drawerScrimColor: Colors.transparent,
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Сбросить',
                                style: AppFonts.normal13,
                              ),
                            ),
                            Text(
                              'Фильтр',
                              style: AppFonts.bold18.copyWith(color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.close, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 45),
                        AppDropDownWidget(
                          label: 'Страна',
                          items: const <String>[
                            'Item 1',
                            'Item 2',
                            'Item 3',
                            'Item 4',
                          ],
                          onChanged: (List<String>? item) {},
                        ),
                        const SizedBox(height: 15),
                        ToggleButtonRow(
                          onOptionChanged: (String selectedItem) {},
                          options: const <String>[
                            'Все',
                            'С пробегом',
                            'Новые',
                          ],
                        ),
                        const SizedBox(height: 29),
                        Text(
                          'Цена',
                          style: AppFonts.bold18.copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            AppTextFormField(
                              controller: TextEditingController(),
                              hintText: 'От',
                            ),
                            const SizedBox(width: 25),
                            AppTextFormField(
                              controller: TextEditingController(),
                              hintText: 'До',
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        AppDropDownWidget(
                          label: 'Марка',
                          items: state.brands.getNames,
                          hasCheckbox: true,
                          onChanged: (List<String>? items) {
                            if (items == null) return;
                            final List<int> brandsIDs = state.brands.getIdsByName(items);
                            context.read<HomeBloc>().add(FetchModelsEvent(brandsIDs: brandsIDs));
                          },
                        ),
                        const SizedBox(height: 25),
                        AppDropDownWidget(
                          label: 'Модель',
                          items: state.models.getNames,
                          onChanged: (List<String>? item) {},
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'Год выпуска',
                          style: AppFonts.bold18.copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            AppTextFormField(
                              controller: TextEditingController(),
                              hintText: 'От',
                            ),
                            const SizedBox(width: 25),
                            AppTextFormField(
                              controller: TextEditingController(),
                              hintText: 'До',
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'Пробег',
                          style: AppFonts.bold18.copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            AppTextFormField(
                              controller: TextEditingController(),
                              hintText: 'От',
                            ),
                            const SizedBox(width: 25),
                            AppTextFormField(
                              controller: TextEditingController(),
                              hintText: 'До',
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text('CAR BY'),
          ),
        );
      },
    );
  }
}
