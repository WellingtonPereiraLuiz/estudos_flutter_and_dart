
class Pet {
  final String name;
  final String photoUrl; 
  final String localAssetAlt; 
  final String size; 
  final String temperament;
  bool isInterested;


   Pet({
    required this.name,
    required this.photoUrl,
    required this.localAssetAlt,
    required this.size,
    required this.temperament,
    this.isInterested = false,
  });
}
