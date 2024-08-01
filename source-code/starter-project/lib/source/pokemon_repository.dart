import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/data/pokemon.dart';

class PokemonRepository {
  Future<List<Pokemon>> getAllPokemon() async {
    final String response = await rootBundle.loadString('assets/files/pokemons.json');
    final data = jsonDecode(response) as List<dynamic>;
    return data.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
  }
}