import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_navigation/constants/route_names.dart';
import 'package:pokemon_navigation/core/data/pokemon_service.dart';
import 'package:provider/provider.dart';

import '../../core/auth/auth_state.dart';
import '../../models/data/pokemon.dart';
import '../widgets/loading_widget.dart';
import '../widgets/pokemon_cards.dart';

class PokemonsSreen extends StatefulWidget {
  const PokemonsSreen({super.key});

  @override
  PokemonsSreenState createState() => PokemonsSreenState();
}

class PokemonsSreenState extends State<PokemonsSreen> {
  final GlobalKey<NestedScrollViewState> _scrollKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollKey.currentState?.innerController.dispose();
    _scrollKey.currentState?.dispose();

    super.dispose();
  }

  void _onPokemonPress(Pokemon pokemon) {
    context.goNamed(Routes.pokemonDetailRoute.name,
        pathParameters: {'pokemonId': pokemon.id});
  }

  @override
  Widget build(BuildContext context) {
    final pokemonService = context.watch<PokemonService>();
    final authState = context.watch<AuthState>();
    final pokemons = pokemonService.getAllPokemon();
    return pokemonService.isLoaded && authState.initialized
        ? _buildPokemonList(pokemons)
        : const LoadingWidget();
  }

  Widget _buildPokemonList(List<Pokemon> pokemons) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(28),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.5,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        return PokemonCard(
          pokemon,
          onPress: () => _onPokemonPress(pokemon),
        );
      },
    );
  }
}
