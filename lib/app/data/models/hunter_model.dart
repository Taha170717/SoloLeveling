class HunterModel {
  final String id;
  final String name;
  final String rank;
  final String imageUrl;
  final String description;
  final Map<String, int> stats;
  final List<String> abilities;
  final String guild;

  HunterModel({
    required this.id,
    required this.name,
    required this.rank,
    required this.imageUrl,
    required this.description,
    required this.stats,
    required this.abilities,
    required this.guild,
  });

  factory HunterModel.fromJson(Map<String, dynamic> json) {
    return HunterModel(
      id: json['id'],
      name: json['name'],
      rank: json['rank'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      stats: Map<String, int>.from(json['stats']),
      abilities: List<String>.from(json['abilities']),
      guild: json['guild'],
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
      'guild': guild,
    };
  }
}
