import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/route_names.dart';
import '../../../../models/data/pokemon.dart';
import '../../../../models/widget/header_link_data.dart';
import '../../../widgets/animated_faded.dart';
import '../../../widgets/hero_text.dart';
import '../../../widgets/pokemon_image.dart';
import '../../../widgets/pokemon_type.dart';
import '../../../widgets/web_header.dart';

class PokemonOverallInfo extends StatefulWidget {
  final Pokemon pokemon;
  final AnimationController slideController;
  final AnimationController rotationController;
  const PokemonOverallInfo(
      {super.key,
      required this.pokemon,
      required this.slideController,
      required this.rotationController});

  @override
  PokemonOverallInfoState createState() => PokemonOverallInfoState();
}

class PokemonOverallInfoState extends State<PokemonOverallInfo>
    with TickerProviderStateMixin {
  final GlobalKey _currentTextKey = GlobalKey();

  double textDiffLeft = 0.0;
  double textDiffTop = 0.0;

  AnimationController get slideController => widget.slideController;
  AnimationController get rotateController => widget.rotationController;

  Animation<double> get textFadeAnimation =>
      Tween(begin: 1.0, end: 0.0).animate(slideController);
  Animation<double> get sliderFadeAnimation =>
      Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: slideController,
        curve: const Interval(0.0, 0.5, curve: Curves.ease),
      ));

  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;
    return NestedScrollView(
      headerSliverBuilder: (_, __) => [_buildHeader()],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildPokemonName(pokemon),
          const SizedBox(height: 9),
          _buildPokemonTypes(pokemon),
          const SizedBox(height: 25),
          _buildPokemon(pokemon),
        ],
      ),
    );
  }

  Widget _buildPokemonName(Pokemon pokemon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: slideController,
            builder: (_, __) {
              final value = slideController.value;

              return Transform.translate(
                offset: Offset(textDiffLeft * value, textDiffTop * value),
                child: HeroText(
                  pokemon.name,
                  textKey: _currentTextKey,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 36 - (36 - 22) * value,
                  ),
                ),
              );
            },
          ),
          AnimatedSlide(
            offset: Offset.zero,
            duration: const Duration(milliseconds: 500),
            child: AnimatedFade(
              animation: textFadeAnimation,
              child: HeroText(
                pokemon.id,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonTypes(Pokemon pokemon) {
    return AnimatedFade(
      animation: textFadeAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...pokemon.typeofpokemon.map(
                    (type) => PokemonType(
                      type,
                      large: true,
                    ),
                  )
                ],
              ),
            ),
            AnimatedSlide(
              offset: Offset.zero,
              duration: const Duration(milliseconds: 500),
              child: Text(
                pokemon.category,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemon(Pokemon pokemon) {
    final screenSize = MediaQuery.sizeOf(context);
    final sliderHeight = screenSize.height * 0.24;
    final pokeballSize = screenSize.height * 0.24;
    final pokemonSize = screenSize.height * 0.3;

    return AnimatedFade(
      animation: sliderFadeAnimation,
      child: SizedBox(
        width: screenSize.width,
        height: sliderHeight,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: RotationTransition(
                turns: rotateController,
                child: Image.asset(
                  'assets/images/pokeball.png', // Replace with actual asset path
                  width: pokeballSize,
                  height: pokeballSize,
                  color: Colors.white.withOpacity(0.12),
                ),
              ),
            ),
            Center(
              child: PokemonImage(
                pokemon: pokemon,
                size: Size.square(pokemonSize),
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                ),
                useHero: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return WebHeader(
      title: 'Pokedex',
      headers: [
        HeaderLinkData(
            label: 'Pokemons',
            navigationCallBack: () =>
                context.goNamed(Routes.pokemonsRoute.name)),
        HeaderLinkData(
            label: 'Favourites',
            navigationCallBack: () =>
                context.goNamed(Routes.favouriteRoute.name)),
        HeaderLinkData(
            label: 'News',
            navigationCallBack: () => context.goNamed(Routes.newsRoute.name)),
      ],
    );
  }
}
