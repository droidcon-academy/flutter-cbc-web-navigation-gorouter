import 'dart:ui';

import '../../themes/colors.dart';


enum PokemonTypes {
  grass('Grass', AppColors.lightGreen),
  poison('Poison', AppColors.lightPurple),
  fire('Fire', AppColors.lightRed),
  flying('Flying', AppColors.lilac),
  water('Water', AppColors.lightBlue),
  bug('Bug', AppColors.lightTeal),
  normal('Normal', AppColors.beige),
  electric('Electric', AppColors.lightYellow),
  ground('Ground', AppColors.darkBrown),
  fairy('Fairy', AppColors.pink),
  fighting('Fighting', AppColors.red),
  psychic('Psychic', AppColors.lightPink),
  rock('Rock', AppColors.lightBrown),
  steel('Steel', AppColors.grey),
  ice('Ice', AppColors.lightCyan),
  ghost('Ghost', AppColors.purple),
  dragon('Dragon', AppColors.violet),
  dark('Dark', AppColors.black),
  monster('Monster', AppColors.lightBlue),
  unknown('Unknown', AppColors.lightBlue);

  final String displayName;
  final Color color;

  const PokemonTypes(this.displayName, this.color);

  static PokemonTypes parse(String rawValue) => values.firstWhere(
        (e) => e.name == rawValue.toLowerCase(),
        orElse: () => unknown,
      );

  Map<PokemonTypes, double> get effectiveness => _pokemonEffectivenessMap[this] ?? {};
}

final _pokemonEffectivenessMap = <PokemonTypes, Map<PokemonTypes, double>>{
  PokemonTypes.normal: {
    PokemonTypes.ghost: 0,
    PokemonTypes.fighting: 2,
  },
  PokemonTypes.fire: {
    PokemonTypes.bug: 0.5,
    PokemonTypes.fairy: 0.5,
    PokemonTypes.fire: 0.5,
    PokemonTypes.grass: 0.5,
    PokemonTypes.ice: 0.5,
    PokemonTypes.steel: 0.5,
    PokemonTypes.ground: 2,
    PokemonTypes.rock: 2,
    PokemonTypes.water: 2,
  },
  PokemonTypes.water: {
    PokemonTypes.fire: 0.5,
    PokemonTypes.ice: 0.5,
    PokemonTypes.steel: 0.5,
    PokemonTypes.water: 0.5,
    PokemonTypes.electric: 2,
    PokemonTypes.grass: 2,
  },
  PokemonTypes.electric: {
    PokemonTypes.electric: 0.5,
    PokemonTypes.flying: 0.5,
    PokemonTypes.steel: 0.5,
    PokemonTypes.ground: 2,
  },
  PokemonTypes.grass: {
    PokemonTypes.electric: 0.5,
    PokemonTypes.grass: 0.5,
    PokemonTypes.ground: 0.5,
    PokemonTypes.water: 0.5,
    PokemonTypes.bug: 2,
    PokemonTypes.ice: 2,
    PokemonTypes.flying: 2,
    PokemonTypes.fire: 2,
    PokemonTypes.poison: 2,
  },
  PokemonTypes.ice: {
    PokemonTypes.ice: 0.5,
    PokemonTypes.fire: 2,
    PokemonTypes.fighting: 2,
    PokemonTypes.rock: 2,
    PokemonTypes.steel: 2,
  },
  PokemonTypes.fighting: {
    PokemonTypes.bug: 0.5,
    PokemonTypes.rock: 0.5,
    PokemonTypes.dark: 0.5,
    PokemonTypes.flying: 2,
    PokemonTypes.psychic: 2,
    PokemonTypes.fairy: 2,
  },
  PokemonTypes.poison: {
    PokemonTypes.fighting: 0.5,
    PokemonTypes.poison: 0.5,
    PokemonTypes.bug: 0.5,
    PokemonTypes.fairy: 0.5,
    PokemonTypes.ground: 2,
    PokemonTypes.psychic: 2,
  },
  PokemonTypes.ground: {
    PokemonTypes.electric: 0,
    PokemonTypes.poison: 0.5,
    PokemonTypes.rock: 0.5,
    PokemonTypes.water: 2,
    PokemonTypes.grass: 2,
    PokemonTypes.ice: 2,
  },
  PokemonTypes.flying: {
    PokemonTypes.ground: 0,
    PokemonTypes.grass: 0.5,
    PokemonTypes.fighting: 0.5,
    PokemonTypes.bug: 0.5,
    PokemonTypes.electric: 2,
    PokemonTypes.ice: 2,
    PokemonTypes.rock: 2,
  },
  PokemonTypes.psychic: {
    PokemonTypes.fighting: 0.5,
    PokemonTypes.psychic: 0.5,
    PokemonTypes.bug: 2,
    PokemonTypes.ghost: 2,
    PokemonTypes.dark: 2,
  },
  PokemonTypes.bug: {
    PokemonTypes.grass: 0.5,
    PokemonTypes.fighting: 0.5,
    PokemonTypes.ground: 0.5,
    PokemonTypes.fire: 2,
    PokemonTypes.flying: 2,
    PokemonTypes.rock: 2,
  },
  PokemonTypes.rock: {
    PokemonTypes.normal: 0.5,
    PokemonTypes.fire: 0.5,
    PokemonTypes.poison: 0.5,
    PokemonTypes.flying: 0.5,
    PokemonTypes.water: 2,
    PokemonTypes.grass: 2,
    PokemonTypes.fighting: 2,
    PokemonTypes.ground: 2,
    PokemonTypes.steel: 2,
  },
  PokemonTypes.ghost: {
    PokemonTypes.normal: 0,
    PokemonTypes.fighting: 0,
    PokemonTypes.poison: 0.5,
    PokemonTypes.bug: 0.5,
    PokemonTypes.ghost: 2,
    PokemonTypes.dark: 2,
  },
  PokemonTypes.dragon: {
    PokemonTypes.fire: 0.5,
    PokemonTypes.water: 0.5,
    PokemonTypes.electric: 0.5,
    PokemonTypes.grass: 0.5,
    PokemonTypes.ice: 2,
    PokemonTypes.dragon: 2,
    PokemonTypes.fairy: 2,
  },
  PokemonTypes.dark: {
    PokemonTypes.psychic: 0,
    PokemonTypes.ghost: 0.5,
    PokemonTypes.dark: 0.5,
    PokemonTypes.fighting: 2,
    PokemonTypes.bug: 2,
    PokemonTypes.fairy: 2,
  },
  PokemonTypes.steel: {
    PokemonTypes.poison: 0,
    PokemonTypes.normal: 0.5,
    PokemonTypes.grass: 0.5,
    PokemonTypes.ice: 0.5,
    PokemonTypes.flying: 0.5,
    PokemonTypes.psychic: 0.5,
    PokemonTypes.bug: 0.5,
    PokemonTypes.rock: 0.5,
    PokemonTypes.dragon: 0.5,
    PokemonTypes.steel: 0.5,
    PokemonTypes.fairy: 0.5,
    PokemonTypes.fire: 2,
    PokemonTypes.fighting: 2,
    PokemonTypes.ground: 2,
  },
  PokemonTypes.fairy: {
    PokemonTypes.dragon: 0,
    PokemonTypes.fighting: 0.5,
    PokemonTypes.bug: 0.5,
    PokemonTypes.dark: 0.5,
    PokemonTypes.poison: 2,
    PokemonTypes.steel: 2,
  },
};
