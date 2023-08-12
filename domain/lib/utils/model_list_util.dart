import '../domain.dart';

extension BaseItemModelListExtension on List<BaseItemModel> {
  List<int> get getIds => map((BaseItemModel e) => e.id).toList();
}
