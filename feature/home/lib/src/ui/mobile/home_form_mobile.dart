import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/src/ui/mobile/widgets/item_widget.dart';

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
                        const RangeRow(title: 'Цена'),
                        const SizedBox(height: 25),
                        AppDropDownWidget(
                          hasCheckbox: true,
                          label: 'Марка',
                          items: state.brands.getNames,
                          onChanged: (List<String>? items) {
                            if (items == null) return;
                            final List<int> brandsIDs = state.brands.getIdsByName(items);
                            context.read<HomeBloc>().add(FetchModelsEvent(brandsIDs: brandsIDs));
                          },
                        ),
                        const SizedBox(height: 25),
                        AppDropDownWidget(
                          hasCheckbox: true,
                          label: 'Модель',
                          items: state.models.getNames,
                          onChanged: (List<String>? items) {
                            if (items == null) return;

                            final List<int> modelsIDs = items.map((String item) {
                              final ModelModel model =
                                  state.models.firstWhere((ModelModel model) => model.name == item);
                              return model.id;
                            }).toList();

                            context
                                .read<HomeBloc>()
                                .add(FetchGenerationsEvent(modelsIDs: modelsIDs));
                          },
                        ),
                        const SizedBox(height: 25),
                        AppDropDownWidget(
                          hasCheckbox: true,
                          label: 'Поколение',
                          items: state.generations.getNames,
                          onChanged: (List<String>? items) {
                            if (items == null) return;

                            final List<int> generationssIDs = items.map((String item) {
                              final GenerationModel generations = state.generations.firstWhere(
                                  (GenerationModel generations) => generations.name == item);
                              return generations.id;
                            }).toList();

                            // TODO(Kemal): Handle Remain
                          },
                        ),
                        const SizedBox(height: 25),
                        const RangeRow(title: 'Год выпуска'),
                        const SizedBox(height: 25),
                        const RangeRow(title: 'Пробег'),
                        const SizedBox(height: 25),
                        AppCheckBoxGroup(
                          title: 'Коробка передач',
                          onChanged: (List<String> options) {},
                          options: const <String>[
                            'Автомат',
                            'Механика',
                            'Робот',
                          ],
                        ),
                        const SizedBox(height: 15),
                        AppCheckBoxGroup(
                          title: 'Тип двигателя',
                          onChanged: (List<String> options) {},
                          options: const <String>[
                            'Бензин',
                            'Газ',
                            'Дизель',
                          ],
                        ),
                        const SizedBox(height: 25),
                        const RangeRow(title: 'Мощность двигателя'),
                        const SizedBox(height: 15),
                        AppCheckBoxGroup(
                          title: 'Привод',
                          onChanged: (List<String> options) {},
                          options: const <String>[
                            'Передний',
                            'Задний',
                            'Полный',
                          ],
                        ),
                        const SizedBox(height: 15),
                        const ToggleGroupWidget(
                          title: 'Состояние',
                          options: <String>[
                            'Все',
                            'Кроме битых',
                            'Битые',
                          ],
                        ),
                        const SizedBox(height: AppDimens.PADDING_25),
                        const ToggleGroupWidget(
                          title: 'Регистрация автомобиля',
                          options: <String>[
                            'Неважна',
                            'Есть',
                            'Нет',
                          ],
                        ),
                        const SizedBox(height: AppDimens.PADDING_25),
                        AppCheckBoxGroup(
                          title: 'Тип кузова',
                          onChanged: (List<String> options) {},
                          options: const <String>[
                            'Седан',
                            'Купе',
                            'Универсал',
                            'Внедорожник',
                            'Хетчбек',
                          ],
                        ),
                        const SizedBox(height: AppDimens.PADDING_15),
                        const ToggleGroupWidget(
                          title: 'Руль',
                          options: <String>[
                            'Все',
                            'Левый',
                            'Правый',
                          ],
                        ),
                        const SizedBox(height: AppDimens.PADDING_25),
                        const ToggleGroupWidget(
                          title: 'Продавцы',
                          options: <String>[
                            'Все',
                            'Частный',
                            'Дилеры',
                          ],
                        ),
                        const SizedBox(height: AppDimens.PADDING_25),
                        Text('Сортировка', style: AppFonts.bold18),
                        RadioButtonGroup(
                          items: const <String>[
                            'По умолчанию',
                            'По дате',
                            'Дешевле',
                            'Дороже',
                            'По удаленности',
                          ],
                          onItemSelected: (String item) {},
                        ),
                        const SizedBox(height: AppDimens.PADDING_45),
                        AppButton(
                          text: 'Применить',
                          onPressed: () {},
                          verticalPadding: AppDimens.PADDING_12,
                          radius: AppDimens.BORDER_RADIUS_10,
                        ),
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
          body: Column(
            children: <Widget>[
              ItemWidget(),
            ],
          ),
        );
      },
    );
  }
}
