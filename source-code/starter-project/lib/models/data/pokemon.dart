import 'pokemon_types.dart';

class Pokemon {
  final String name;
  final String id;
  final String imageurl;
  final String description;
  final String height;
  final String category;
  final String weight;
  final List<PokemonTypes> typeofpokemon;
  final List<String> weaknesses;
  final List<String> evolutions;
  final List<String> abilities;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final int total;
  final int genderless;
  final String cycles;
  final String eggGroups;
  final String evolvedfrom;
  final String reason;
  final String baseExp;

  Pokemon({
    required this.name,
    required this.id,
    required this.imageurl,
    required this.description,
    required this.height,
    required this.category,
    required this.weight,
    required this.typeofpokemon,
    required this.weaknesses,
    required this.evolutions,
    required this.abilities,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.total,
    required this.genderless,
    required this.cycles,
    required this.eggGroups,
    required this.evolvedfrom,
    required this.reason,
    required this.baseExp,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: (json['id'] as String).substring(1),
      imageurl: json['imageurl'],
      description: json['xdescription'],
      height: json['height'],
      category: json['category'],
      weight: json['weight'],
      typeofpokemon: List<String>.from(json['typeofpokemon'])
          .map((type) => PokemonTypes.parse(type))
          .toList(),
      weaknesses: List<String>.from(json['weaknesses']),
      evolutions: List<String>.from(json['evolutions']),
      abilities: List<String>.from(json['abilities']),
      hp: json['hp'],
      attack: json['attack'],
      defense: json['defense'],
      specialAttack: json['special_attack'],
      specialDefense: json['special_defense'],
      speed: json['speed'],
      total: json['total'],
      genderless: json['genderless'],
      cycles: json['cycles'],
      eggGroups: json['egg_groups'],
      evolvedfrom: json['evolvedfrom'],
      reason: json['reason'],
      baseExp: json['base_exp'],
    );
  }
}
