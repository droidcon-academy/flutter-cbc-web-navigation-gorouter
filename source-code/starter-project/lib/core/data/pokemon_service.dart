import 'dart:math';
import 'package:pokemon_navigation/extensions/list.dart';

import '../../models/data/pokemon.dart';
import '../../source/pokemon_repository.dart';

class PokemonService {
  final PokemonRepository pokemonRepository;
  List<Pokemon> _pokemons = [];
  var _filteredPokemons = <Pokemon>[];
  
  PokemonService(this.pokemonRepository);

  Future<void> loadPokemons() async {
    _pokemons = (await pokemonRepository.getAllPokemon()).sublist(0, 50);
  }

  bool get isLoaded => _pokemons.isNotEmpty;

  List<Pokemon> getAllPokemon() {
    return _pokemons;
  }

  Pokemon? getPokemonById(String id) {
    return _pokemons.firstWhereOrNull((pokemon) => pokemon.id == id);
  }

  List<Pokemon> getRandomFavourites() {
    final length = _pokemons.length;
    final randomSelectedLength = min(10, length ~/ 5);
    return _pokemons.getRandomItems(randomSelectedLength);
  }

  List<Pokemon> getPokemonByCategory(String category) {
    return _pokemons.where((pokemon) => pokemon.category == category).toList();
  }

  List<String> getPokemonCategories() {
    return _pokemons.map((pokemon) => pokemon.category).toSet().toList();
  }

  List<Pokemon> filterPokemons(String query) {
    if (query.isNotEmpty) {
      final lowerCaseQuery = query.toLowerCase();
      _filteredPokemons = _pokemons
          .where((pokemon) =>
              pokemon.name.toLowerCase().contains(lowerCaseQuery) ||
              pokemon.category.toLowerCase().contains(lowerCaseQuery))
          .toList();
      return _filteredPokemons;
    }
    return [];
  }
}
