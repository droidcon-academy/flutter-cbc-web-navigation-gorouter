import 'package:flutter/material.dart';
import 'package:pokemon_navigation/core/data/pokemon_service.dart';
import 'package:pokemon_navigation/models/data/pokemon.dart';
import 'package:pokemon_navigation/presentation/screens/pokemon_detail/pokemon_detail_screen.dart';
import 'package:pokemon_navigation/presentation/widgets/loading_widget.dart';
import 'package:pokemon_navigation/themes/extensions.dart';
import 'package:provider/provider.dart';

import '../widgets/pokemon_cards.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final pokemonService = context.watch<PokemonService>();
    final favouritePokemons = pokemonService.getRandomFavourites();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: pokemonService.isLoaded
            ? favouritePokemons.isEmpty
                ? Center(
                    child: Text(
                      'No favourites yet!',
                      style: context.typographies.body
                          .withColor(context.colors.hint),
                    ),
                  )
                : _buildFavouritesList(context, favouritePokemons)
            : const LoadingWidget());
  }

  Widget _buildFavouritesList(
      BuildContext context, List<Pokemon> favouritePokemons) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(28),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 70,
        mainAxisSpacing: 30,
        childAspectRatio: 2.5,
      ),
      itemCount: favouritePokemons.length,
      itemBuilder: (context, index) {
        final pokemon = favouritePokemons[index];
        return PokemonCard(
          pokemon,
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PokemonDetailScreen(id: pokemon.id)),
            );
          },
        );
      },
    );
  }
}
