// lib/models/place.dart
//
class Place {
  final String title;
  final String coverUrl; // para Image.network
  final String description;
  final String localAssetMap; // ex.: 'assets/images/map.png'

  const Place({
    required this.title,
    required this.coverUrl,
    required this.description,
    required this.localAssetMap,
  });
}
