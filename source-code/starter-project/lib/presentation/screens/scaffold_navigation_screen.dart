import 'package:flutter/material.dart';
import 'package:pokemon_navigation/models/widget/header_link_data.dart';
import 'package:pokemon_navigation/presentation/screens/favourite_screen.dart';
import 'package:pokemon_navigation/presentation/screens/news_screen.dart';
import 'package:pokemon_navigation/presentation/screens/pokemons_screen.dart';
import 'package:pokemon_navigation/themes/extensions.dart';

import '../widgets/positioned_pokeball.dart';
import '../widgets/web_header.dart';

class ScaffoldNavigationScreen extends StatefulWidget {
  final Widget child;
  const ScaffoldNavigationScreen({super.key, required this.child});

  @override
  State<ScaffoldNavigationScreen> createState() =>
      _ScaffoldNavigationScreenState();
}

class _ScaffoldNavigationScreenState extends State<ScaffoldNavigationScreen> {
  void _navigationToScreen(
      {required BuildContext context, required Widget screen}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundDark,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const PositionedPokeball(),
          NestedScrollView(
            headerSliverBuilder: (_, __) => [
              WebHeader(
                title: 'Pokedex',
                headers: [
                  HeaderLinkData(
                    label: 'Pokemons',
                    navigationCallBack: () => _navigationToScreen(
                        context: context,
                        screen: const ScaffoldNavigationScreen(
                            child: PokemonsSreen())),
                  ),
                  HeaderLinkData(
                    label: 'Favourites',
                    navigationCallBack: () => _navigationToScreen(
                        context: context,
                        screen: const ScaffoldNavigationScreen(
                            child: FavouriteScreen())),
                  ),
                  HeaderLinkData(
                    label: 'News',
                    navigationCallBack: () => _navigationToScreen(
                      context: context,
                      screen:
                          const ScaffoldNavigationScreen(child: NewsScreen()),
                    ),
                  ),
                ],
              ),
            ],
            body: widget.child,
          )
        ],
      ),
    );
  }
}
