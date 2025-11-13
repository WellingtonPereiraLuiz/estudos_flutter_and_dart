
class Place {
  final String title;
  final String coverUrl; 
  final String description;
  final String localAssetMap;
  bool isFavorite;

  Place({
    required this.title,
    required this.coverUrl,
    required this.description,
    required this.localAssetMap,
    this.isFavorite = false,
  });
}
