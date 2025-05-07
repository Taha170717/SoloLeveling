class MonarchModel {
  final String id;
  final String name;
  final String title;
  final String imageUrl;
  final String description;
  final Map<String, int> stats;
  final List<String> abilities;
  final String army;

  MonarchModel({
    required this.id,
    required this.name,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.stats,
    required this.abilities,
    required this.army,
  });

  factory MonarchModel.fromJson(Map<String, dynamic> json) {
    return MonarchModel(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      stats: Map<String, int>.from(json['stats']),
      abilities: List<String>.from(json['abilities']),
      army: json['army'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'stats': stats,
      'abilities': abilities,
      'army': army,
    };
  }
}
