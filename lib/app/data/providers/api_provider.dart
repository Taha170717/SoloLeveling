import 'package:get/get.dart';
import 'package:shadow_monarch/app/data/models/shadow_model.dart';
import 'package:shadow_monarch/app/data/models/hunter_model.dart';
import 'package:shadow_monarch/app/data/models/monarch_model.dart';
import 'package:shadow_monarch/app/utils/constants.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    // Local data for now, but could be connected to a real API
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return map;
      if (map is List) return map;
    };
    super.onInit();
  }

  // For now, we'll use local data, but this could be replaced with actual API calls
  Future<List<ShadowModel>> getShadows() async {
    // Simulating API delay
    await Future.delayed(const Duration(milliseconds: 800));
    return shadowsList;
  }

  Future<ShadowModel> getShadowById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return shadowsList.firstWhere((shadow) => shadow.id == id);
  }

  Future<List<HunterModel>> getHunters() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return huntersList;
  }

  Future<HunterModel> getHunterById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return huntersList.firstWhere((hunter) => hunter.id == id);
  }

  Future<List<MonarchModel>> getMonarchs() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return monarchsList;
  }

  Future<MonarchModel> getMonarchById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return monarchsList.firstWhere((monarch) => monarch.id == id);
  }

  // Local data with online image URLs
  final List<ShadowModel> shadowsList = [
    ShadowModel(
      id: "1",
      name: "Igris",
      rank: "Marshal",
      imageUrl: "https://static.wikia.nocookie.net/solo-leveling/images/d/d7/Igris22.jpeg/revision/latest/scale-to-width-down/1200?cb=20250130123238", // Igris image
      description: "The first high-ranking shadow soldier of Sung Jin-Woo. Igris was originally a knight of the Demon Castle who served under the Demon King Baran.",
      stats: {
        "Strength": 90,
        "Speed": 85,
        "Intelligence": 75,
        "Loyalty": 100,
      },
      abilities: ["Swordsmanship", "Leadership", "Shadow Teleportation"],
      origin: "Demon Castle Double Dungeon",
    ),
    ShadowModel(
      id: "2",
      name: "Beru",
      rank: "Marshal",
      imageUrl: "https://static.wikia.nocookie.net/solo-leveling/images/1/1b/Beru0.jpg/revision/latest?cb=20250130140143", // Beru image
      description: "The Ant King from Jeju Island who became one of Sung Jin-Woo's most powerful shadow soldiers.",
      stats: {
        "Strength": 95,
        "Speed": 90,
        "Intelligence": 80,
        "Loyalty": 95,
      },
      abilities: ["Enhanced Strength", "Healing", "Telepathy", "Shadow Teleportation"],
      origin: "Jeju Island Raid",
    ),
    ShadowModel(
      id: "3",
      name: "Tank",
      rank: "Knight",
      imageUrl: "https://images2.alphacoders.com/110/thumb-1920-1106775.jpg", // Tank image
      description: "A high orc who was the first shadow soldier summoned by Sung Jin-Woo.",
      stats: {
        "Strength": 75,
        "Speed": 60,
        "Intelligence": 50,
        "Loyalty": 90,
      },
      abilities: ["Enhanced Strength", "Durability", "Shadow Teleportation"],
      origin: "D-Rank Dungeon",
    ),
    ShadowModel(
      id: "4",
      name: "Iron",
      rank: "Elite Knight",
      imageUrl: "https://w0.peakpx.com/wallpaper/334/162/HD-wallpaper-anime-solo-leveling-iron-solo-leveling.jpg", // Iron image
      description: "A former B-rank hunter who was killed during a dungeon raid and later resurrected as a shadow soldier by Sung Jin-Woo.",
      stats: {
        "Strength": 80,
        "Speed": 70,
        "Intelligence": 65,
        "Loyalty": 85,
      },
      abilities: ["Enhanced Strength", "Weapon Mastery", "Shadow Teleportation"],
      origin: "B-Rank Dungeon",
    ),
    ShadowModel(
      id: "5",
      name: "Tusk",
      rank: "Knight",
      imageUrl: "https://pbs.twimg.com/media/Fz5jhkcaQAAg8NR.jpg", // Tusk image (similar to Tank)
      description: "A high orc who was summoned alongside Tank. He serves as one of Sung Jin-Woo's reliable shadow soldiers.",
      stats: {
        "Strength": 75,
        "Speed": 65,
        "Intelligence": 55,
        "Loyalty": 90,
      },
      abilities: ["Enhanced Strength", "Durability", "Shadow Teleportation"],
      origin: "D-Rank Dungeon",
    ),
  ];

  final List<HunterModel> huntersList = [
    HunterModel(
      id: "1",
      name: "Sung Jin-Woo",
      rank: "S-Rank (Shadow Monarch)",
      imageUrl: "https://static.wikia.nocookie.net/solo-leveling/images/8/8b/Jinwoo4.jpg/revision/latest?cb=20250411080707", // Sung Jin-Woo image
      description: "Originally the world's weakest hunter, Sung Jin-Woo becomes the Shadow Monarch after completing the System's trials.",
      stats: {
        "Strength": 100,
        "Speed": 100,
        "Intelligence": 90,
        "Mana": 100,
      },
      abilities: ["Shadow Extraction", "Shadow Storage", "Ruler's Authority", "Dominator's Touch"],
      guild: "None (Solo Player)",
    ),
    HunterModel(
      id: "2",
      name: "Cha Hae-In",
      rank: "S-Rank",
      imageUrl: "https://static.wikia.nocookie.net/solo-leveling/images/9/91/Cha_Hae-In.png/revision/latest?cb=20240119133508", // Cha Hae-In image
      description: "One of Korea's top S-Rank hunters known for her exceptional swordsmanship and ability to detect smells.",
      stats: {
        "Strength": 85,
        "Speed": 90,
        "Intelligence": 80,
        "Mana": 85,
      },
      abilities: ["Enhanced Smell", "Swordsmanship", "Agility"],
      guild: "Hunters Association",
    ),
    HunterModel(
      id: "3",
      name: "Choi Jong-In",
      rank: "S-Rank",
      imageUrl: "https://static.wikia.nocookie.net/p__/images/e/e6/Solo_Leveling_Choi_Jong-In_28Hunter29_Anime_character_render.webp/revision/latest?cb=20240219210249&path-prefix=protagonist", // Choi Jong-In image
      description: "The Guild Master of the Hunters Guild and one of Korea's top S-Rank hunters, specializing in fire magic.",
      stats: {
        "Strength": 80,
        "Speed": 75,
        "Intelligence": 90,
        "Mana": 95,
      },
      abilities: ["Fire Magic", "Leadership", "Tactical Analysis"],
      guild: "Hunters Guild",
    ),
    HunterModel(
      id: "4",
      name: "Baek Yoon-Ho",
      rank: "S-Rank",
      imageUrl: "https://pbs.twimg.com/media/GPbzsssaoAAwCRj.png", // Baek Yoon-Ho image
      description: "The Guild Master of the White Tiger Guild and a powerful S-Rank hunter with the ability to transform into a white tiger.",
      stats: {
        "Strength": 90,
        "Speed": 85,
        "Intelligence": 75,
        "Mana": 80,
      },
      abilities: ["Transformation", "Enhanced Strength", "Enhanced Speed"],
      guild: "White Tiger Guild",
    ),
    HunterModel(
      id: "5",
      name: "Go Gun-Hee",
      rank: "S-Rank",
      imageUrl: "https://static0.gamerantimages.com/wordpress/wp-content/uploads/2025/01/chairman-go-gunhee-s-aura-solo-leveling-season-2-arise-from-the-shadow-episode-4.jpg", // Go Gun-Hee image
      description: "The Chairman of the Korean Hunters Association and one of the most respected S-Rank hunters in Korea.",
      stats: {
        "Strength": 75,
        "Speed": 70,
        "Intelligence": 95,
        "Mana": 90,
      },
      abilities: ["Mana Manipulation", "Leadership", "Strategic Mind"],
      guild: "Hunters Association",
    ),
  ];

  final List<MonarchModel> monarchsList = [
    MonarchModel(
      id: "1",
      name: "Antares",
      title: "King of Dragons (Destruction)",
      imageUrl: "https://static.wikia.nocookie.net/solo-leveling/images/f/f3/Antares1.jpg/revision/latest?cb=20211013150039", // Antares image
      description: "The strongest Monarch and the King of Dragons, representing destruction. He is the main antagonist of Solo Leveling.",
      stats: {
        "Strength": 100,
        "Speed": 95,
        "Intelligence": 95,
        "Mana": 100,
      },
      abilities: ["Dragon Breath", "Destruction Magic", "Flight", "Immense Strength"],
      army: "Dragon Army",
    ),
    MonarchModel(
      id: "2",
      name: "Legia",
      title: "Monarch of Frost",
      imageUrl: "https://static.wikia.nocookie.net/solo-leveling/images/2/23/Legia8.jpg/revision/latest?cb=20210815173629", // Legia image
      description: "The Monarch of Frost who controls ice and cold.",
      stats: {
        "Strength": 85,
        "Speed": 80,
        "Intelligence": 90,
        "Mana": 95,
      },
      abilities: ["Ice Magic", "Freezing", "Cold Resistance", "Ice Constructs"],
      army: "Frost Army",
    ),
    MonarchModel(
      id: "3",
      name: "Baran",
      title: "Monarch of White Flames",
      imageUrl: "https://static.wikia.nocookie.net/solo-leveling/images/2/2c/Baran_Anime1.jpg/revision/latest?cb=20250302055329", // Baran image
      description: "The Monarch of White Flames who controls holy fire.",
      stats: {
        "Strength": 90,
        "Speed": 85,
        "Intelligence": 85,
        "Mana": 90,
      },
      abilities: ["White Flame Magic", "Burning", "Heat Resistance", "Fire Constructs"],
      army: "Flame Army",
    ),
    MonarchModel(
      id: "4",
      name: "Querehsha",
      title: "Monarch of Plagues",
      imageUrl: "https://static.wikia.nocookie.net/solo-leveling/images/f/fe/Querehsha1.jpg/revision/latest?cb=20210803223313", // Querehsha image
      description: "The Monarch of Plagues who controls diseases and insects.",
      stats: {
        "Strength": 80,
        "Speed": 85,
        "Intelligence": 95,
        "Mana": 90,
      },
      abilities: ["Plague Magic", "Insect Control", "Disease Immunity", "Regeneration"],
      army: "Insect Army",
    ),
    MonarchModel(
      id: "5",
      name: "Ashborn",
      title: "Shadow Monarch",
      imageUrl: "https://static.wikia.nocookie.net/p__/images/0/06/Solo_Leveling_manhaw_Ashborn_on_horse1.png/revision/latest?cb=20250309150549&path-prefix=protagonist", // Ashborn image
      description: "The original Shadow Monarch who passed his powers to Sung Jin-Woo.",
      stats: {
        "Strength": 95,
        "Speed": 95,
        "Intelligence": 100,
        "Mana": 100,
      },
      abilities: ["Shadow Manipulation", "Shadow Extraction", "Ruler's Authority", "Immortality"],
      army: "Shadow Army",
    ),
  ];
}
