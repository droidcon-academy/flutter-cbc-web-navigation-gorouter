import 'package:flutter/material.dart';

import '../../models/data/pokemon.dart';
import '../screens/pokemon_detail/pokemon_detail_screen.dart';
import 'pokemon_cards.dart';

class PokemonGrid extends StatelessWidget {
  final List<Pokemon> pokemons;
  const PokemonGrid({super.key, required this.pokemons});

  void _onPokemonPress(BuildContext context, Pokemon pokemon) {
      Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PokemonDetailScreen(id: pokemon.id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(28),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.5,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                final pokemon = pokemons[index];
                return PokemonCard(
                  pokemon,
                  onPress: () => _onPokemonPress(context, pokemon),
                );
              },
              childCount: pokemons.length,
            ),
          ),
        ),
      ],
    );
  }
}
