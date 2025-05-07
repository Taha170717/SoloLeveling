class ShadowModel {
  final String id;
  final String name;
  final String rank;
  final String imageUrl;
  final String description;
  final Map<String, int> stats;
  final List<String> abilities;
  final String origin;

  ShadowModel({
    required this.id,
    required this.name,
    required this.rank,
    required this.imageUrl,
    required this.description,
    required this.stats,
    required this.abilities,
    required this.origin,
  });

  factory ShadowModel.fromJson(Map<String, dynamic> json) {
    return ShadowModel(
      id: json['id'],
      name: json['name'],
      rank: json['rank'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      stats: Map<String, int>.from(json['stats']),
      abilities: List<String>.from(json['abilities']),
      origin: json['origin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rank': rank,
      'imageUrl': imageUrl,
      'description': description,
      'stats': stats,
      'abilities': abilities,
      'origin': origin,
    };
  }
}
