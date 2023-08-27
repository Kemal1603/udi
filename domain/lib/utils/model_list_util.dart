import '../models/base_item_model.dart';

extension BaseItemModelListExtension on List<BaseItemModel> {
  List<int> get getIds => map((BaseItemModel e) => e.id).toList();

  List<String> get getNames => map((BaseItemModel e) => e.name).toList();
}
