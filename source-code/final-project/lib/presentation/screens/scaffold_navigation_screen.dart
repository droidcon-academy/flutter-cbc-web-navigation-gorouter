import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_navigation/constants/route_names.dart';
import 'package:pokemon_navigation/models/widget/header_link_data.dart';
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
                      navigationCallBack: () =>
                          context.goNamed(Routes.pokemonsRoute.name)),
                  HeaderLinkData(
                      label: 'Favourites',
                      navigationCallBack: () =>
                          context.goNamed(Routes.favouriteRoute.name)),
                  HeaderLinkData(
                      label: 'News',
                      navigationCallBack: () =>
                          context.goNamed(Routes.newsRoute.name)),
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
