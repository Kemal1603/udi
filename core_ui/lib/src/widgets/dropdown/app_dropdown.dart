import 'package:core_ui/core_ui.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

part 'app_dropdown_enum.dart';

class AppDropDownWidget extends StatefulWidget {
  final List<String> items;
  final bool hasCheckbox;
  final bool withIcons;
  final double width;
  final String? hint;
  final String? label;
  final bool isAllAsDefault;
  final bool isExpanded;
  final void Function(List<String>?) onChanged;

  const AppDropDownWidget({
    required this.items,
    required this.onChanged,
    this.width = 250,
    this.hint,
    this.label,
    this.hasCheckbox = false,
    this.withIcons = false,
    this.isAllAsDefault = false,
    this.isExpanded = false,
    Key? key,
  }) : super(key: key);

  @override
  _AppDropDownWidgetState createState() => _AppDropDownWidgetState();
}

class _AppDropDownWidgetState extends State<AppDropDownWidget> {
  final List<String> selectedItems = <String>[];
  final List<String> values = <String>[];
  bool _isOpen = false;
  final List<ValueNotifier<bool>> _notifiers = <ValueNotifier<bool>>[];
  final ValueNotifier<_CheckAllState> _checkAllState =
      ValueNotifier<_CheckAllState>(_CheckAllState.unchecked);

  @override
  void initState() {
    super.initState();
    values.addAll(widget.items);
    if (widget.isAllAsDefault) {
      selectedItems.addAll(values);
    }
    _notifiers.addAll(
      List<ValueNotifier<bool>>.generate(
        values.length,
        (_) => ValueNotifier<bool>(widget.isAllAsDefault),
      ),
    );
    if (widget.isAllAsDefault) {
      _checkAllState.value = _CheckAllState.checked;
    }
  }

  void _onChanged([String? value]) {
    setState(() {
      if (!widget.hasCheckbox && value != null) {
        selectedItems.clear();
        selectedItems.add(value);
      }
      widget.onChanged(selectedItems);
    });
  }

  String _getSelectedItemText() {
    const int maxLength = 15;
    if (widget.isAllAsDefault) {
      return 'asdfasfd';
    }
    if (selectedItems.isEmpty) {
      return 'Select option';
    }
    if (selectedItems.length > 1) {
      final String selectedString = selectedItems.join(', ');
      String resultString = '';
      if (selectedString.length > maxLength) {
        for (final String item in selectedItems
          ..sort(
            (String a, String b) => a.length.compareTo(b.length),
          )) {
          if (item == 'transaction.transactionFilterType.all') {
            return 'bbbbbbbbbbb';
          }
          if (resultString.length + item.length <= maxLength) {
            resultString += '$item, ';
          } else {
            resultString +=
                '+${selectedItems.length - selectedItems.indexOf(item)} ${'general.more'}';
            break;
          }
        }
        return resultString;
      }

      return selectedString;
    }
    return selectedItems.last;
  }

  void _onSelectCheckBox(String item) {
    final int index = values.indexOf(item);
    final bool isChecked = selectedItems.contains(item);
    isChecked ? selectedItems.remove(item) : selectedItems.add(item);
    _notifiers[index].value = !_notifiers[index].value;
    _checkAllStatus();
    _onChanged(item);
  }

  void _checkAllStatus() {
    if (selectedItems.length == values.length) {
      _checkAllState.value = _CheckAllState.checked;
    } else if (selectedItems.isNotEmpty && values.length > selectedItems.length) {
      _checkAllState.value = _CheckAllState.indeterminate;
    } else {
      _checkAllState.value = _CheckAllState.unchecked;
    }
  }

  void _onSelectAllClick(_CheckAllState state) {
    if (state == _CheckAllState.checked) {
      selectedItems.clear();
      selectedItems.addAll(values);
      _notifiers.forEach(
        (ValueNotifier<bool> notifier) {
          notifier.value = true;
        },
      );
    } else {
      selectedItems.clear();
      _notifiers.forEach((ValueNotifier<bool> notifier) {
        notifier.value = false;
      });
    }
    _checkAllState.value = state;
    _onChanged();
  }

  void _clearSelection() {
    setState(() {
      selectedItems.clear();
      for (var notifier in _notifiers) {
        notifier.value = false;
      }
      _checkAllState.value = _CheckAllState.unchecked;
      _onChanged();
    });
  }

  Widget _getSuffixIcon() {
    if (selectedItems.isNotEmpty) {
      return Flexible(
        child: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: _clearSelection,
        ),
      );
    } else {
      return const Icon(Icons.keyboard_arrow_down);
    }
  }

  DropdownMenuItem<String> _buildSelectAllWidget() {
    return DropdownMenuItem<String>(
      value: 'cccccc',
      enabled: false,
      child: ValueListenableBuilder<_CheckAllState>(
        valueListenable: _checkAllState,
        builder: (BuildContext context, _CheckAllState state, Widget? child) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.PADDING_10,
              vertical: AppDimens.PADDING_12,
            ),
            width: double.infinity,
            child: IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {
                      _onSelectAllClick(_CheckAllState.checked);
                    },
                    child: Text(
                      'Select all',
                      style: state == _CheckAllState.checked
                          ? AppFonts.normal16.copyWith(
                              color: AppColors.of(context).alizarin50,
                            )
                          : AppFonts.bold16.copyWith(
                              color: AppColors.of(context).alizarin,
                            ),
                    ),
                  ),
                  const SizedBox(width: AppDimens.ITEM_SIZE_5),
                  VerticalDivider(
                    color: AppColors.of(context).alizarin50,
                  ),
                  const SizedBox(width: AppDimens.ITEM_SIZE_5),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {
                      _onSelectAllClick(_CheckAllState.unchecked);
                    },
                    child: Text(
                      'Clear',
                      style: state == _CheckAllState.unchecked
                          ? AppFonts.normal16.copyWith(
                              color: AppColors.of(context).alizarin50,
                            )
                          : AppFonts.bold16.copyWith(
                              color: AppColors.of(context).alizarin,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildListWithCheckbox() {
    final List<DropdownMenuItem<String>> items = <DropdownMenuItem<String>>[
      _buildSelectAllWidget(),
    ];
    for (var item in values) {
      items.add(
        DropdownMenuItem<String>(
          value: item,
          enabled: false,
          child: ValueListenableBuilder<bool>(
            valueListenable: _notifiers[values.indexOf(item)],
            builder: (BuildContext context, bool value, Widget? child) {
              return InkWell(
                onTap: () => _onSelectCheckBox(item),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.PADDING_10,
                    vertical: AppDimens.PADDING_12,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: AppDimens.ITEM_SIZE_16,
                        height: AppDimens.ITEM_SIZE_16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppDimens.BORDER_RADIUS_2,
                          ),
                          color: AppColors.of(context).white,
                          border: Border.all(
                            color: AppColors.of(context).gray,
                            width: 1.5,
                          ),
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 100),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return ScaleTransition(scale: animation, child: child);
                          },
                          child: selectedItems.contains(item)
                              ? Center(
                                  child: Icon(
                                    Icons.check,
                                    size: AppDimens.ITEM_SIZE_14,
                                    color: AppColors.of(context).alizarin,
                                  ),
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(width: AppDimens.ITEM_SIZE_5),
                      SizedBox(
                        width: widget.width - AppDimens.ITEM_SIZE_45,
                        child: Row(
                          children: <Widget>[
                            if (widget.withIcons) ...<Widget>[
                              AppImage(
                                width: AppDimens.ITEM_SIZE_20,
                                height: AppDimens.ITEM_SIZE_20,
                                image: item.contains('Safe')
                                    ? AppImages.safePageIcon
                                    : AppImages.cashDrawerSelected,
                                color: AppColors.of(context).matterhorn,
                              ),
                              const SizedBox(width: AppDimens.ITEM_SIZE_6),
                            ],
                            SizedBox(
                              width: widget.withIcons
                                  ? widget.width - AppDimens.ITEM_SIZE_75
                                  : widget.width - AppDimens.ITEM_SIZE_45,
                              child: Text(
                                item,
                                style: AppFonts.normal16.copyWith(
                                  color: AppColors.of(context).matterhorn,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<String>> _buildListWithoutCheckbox() {
    return values
        .map(
          (String item) => DropdownMenuItem<String>(
            value: item,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.PADDING_10,
                vertical: AppDimens.PADDING_12,
              ),
              width: double.infinity,
              child: Text(
                item,
                style: AppFonts.normal16.copyWith(
                  color: AppColors.of(context).matterhorn,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: colors.nightBlue5,
        hoverColor: colors.nightBlue5,
        focusColor: colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.label != null)
            Text(
              '${widget.label}',
              style: AppFonts.bold18,
            ),
          const SizedBox(height: 10),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: _isOpen
                  ? const BorderRadius.vertical(
                      top: Radius.circular(AppDimens.BORDER_RADIUS_10),
                    )
                  : BorderRadius.circular(AppDimens.BORDER_RADIUS_15),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                onMenuStateChange: (bool isOpen) => setState(() => _isOpen = isOpen),
                selectedItemBuilder: (_) {
                  return <Widget>[
                    Center(
                      child: Container(
                        width: widget.width - AppDimens.ITEM_SIZE_25,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.PADDING_10,
                        ),
                        child: Text(
                          _getSelectedItemText(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.normal16.copyWith(
                            color: colors.matterhorn,
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                onChanged: _onChanged,
                items: widget.hasCheckbox ? _buildListWithCheckbox() : _buildListWithoutCheckbox(),
                hint: Container(
                  width: widget.width - AppDimens.ITEM_SIZE_25,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.PADDING_10,
                  ),
                  child: Text(
                    _getSelectedItemText(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.normal16.copyWith(
                      color: colors.matterhorn,
                    ),
                  ),
                ),
                style: AppFonts.normal16.copyWith(
                  color: colors.matterhorn,
                ),
                isExpanded: widget.isExpanded,
                buttonStyleData: ButtonStyleData(
                  height: AppDimens.ITEM_SIZE_40,
                  width: widget.width,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    border: _isOpen
                        ? Border(
                            bottom: BorderSide(color: colors.alizarin),
                          )
                        : null,
                    color: _isOpen ? colors.alizarin10 : colors.whiteSmoke,
                  ),
                  elevation: 0,
                ),
                iconStyleData: IconStyleData(
                  iconSize: AppDimens.ITEM_SIZE_20,
                  openMenuIcon: Icon(
                    Icons.keyboard_arrow_up,
                    color: colors.alizarin,
                  ),
                  icon: _getSuffixIcon(),
                ),
                dropdownStyleData: DropdownStyleData(
                  width: widget.width,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(AppDimens.BORDER_RADIUS_4),
                    ),
                    color: colors.whiteSmoke,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: colors.matterhorn.withOpacity(0.5),
                        blurRadius: 2,
                        offset: const Offset(2, 2), // Shadow position
                      ),
                    ],
                  ),
                  elevation: 0,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: AppDimens.ITEM_SIZE_45,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
