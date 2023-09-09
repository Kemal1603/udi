import '../models/base_item_model.dart';

extension BaseItemModelListExtension on List<BaseItemModel> {
  List<int> get getIds => map((BaseItemModel e) => e.id).toList();

  List<String> get getNames => map((BaseItemModel e) => e.name).toList();

  List<int> getIdsByName(List<String> names) {
    final List<int> ids = <int>[];
    forEach(
      (BaseItemModel element) {
        if (names.contains(element.name)) {
          ids.add(element.id);
        }
      },
    );
    return ids;
  }
}
