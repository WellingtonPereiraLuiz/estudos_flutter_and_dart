// lib/models/imc_result.dart
class ImcResult {
  final int? id; // Opcional, auto-increment do Sqflite
  final double weight;
  final double height;
  final double imc;
  final String classification;
  final DateTime date;

  ImcResult({
    this.id,
    required this.weight,
    required this.height,
    required this.imc,
    required this.classification,
    required this.date,
  });
}
