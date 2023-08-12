final class AdvertRequest {
  final int page;
  final int pageSize;
  final List<int>? brandIds;
  final List<int>? modelIds;
  final List<int>? generationIds;
  final List<int>? bodyTypeIds;
  final List<int>? familyIds;

  AdvertRequest({
    required this.page,
    required this.pageSize,
    this.brandIds,
    this.modelIds,
    this.generationIds,
    this.bodyTypeIds,
    this.familyIds,
  });
}
