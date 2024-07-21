import 'package:flutter/material.dart';
import 'package:pokemon_navigation/core/data/pokemon_service.dart';
import 'package:pokemon_navigation/models/data/pokemon.dart';
import 'package:pokemon_navigation/presentation/screens/favourite_screen.dart';
import 'package:pokemon_navigation/presentation/screens/home_screen/widget/search_bar.dart';
import 'package:pokemon_navigation/presentation/screens/news_screen.dart';
import 'package:pokemon_navigation/presentation/screens/pokemons_screen.dart';
import 'package:pokemon_navigation/presentation/screens/scaffold_navigation_screen.dart';
import 'package:pokemon_navigation/presentation/screens/sign_in_screen.dart';
import 'package:pokemon_navigation/presentation/widgets/loading_widget.dart';
import 'package:pokemon_navigation/presentation/widgets/pokemon_grid.dart';
import 'package:provider/provider.dart';

import '../../../themes/colors.dart';
import '../../../themes/extensions.dart';
import 'widget/navigation_card.dart';
import 'widget/pokeball_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  var sortedPokemonsList = <Pokemon>[];

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      sortedPokemonsList =
          context.read<PokemonService>().filterPokemons(searchController.text);
      setState(() {});
    });
  }

  void _navigationToScreen(
      {required BuildContext context, required Widget screen}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pokemonService = context.watch<PokemonService>();

    return Scaffold(
      backgroundColor: context.colors.backgroundDark,
      body: PokeballScaffold(
        body: pokemonService.isLoaded
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(context),
                    PokemonSearchBar(
                      textController: searchController,
                      hintText: 'Search Pokemon, Move, Ability etc',
                    ),
                    Expanded(
                        child: sortedPokemonsList.isEmpty
                            ? _buildNavigationCards(navigationCards: [
                                NavigationCard(
                                  title: 'Pokemons',
                                  color: AppColors.teal,
                                  onPressed: () {
                                    _navigationToScreen(
                                        context: context,
                                        screen: const ScaffoldNavigationScreen(
                                          child: PokemonsSreen(),
                                        ));
                                  },
                                ),
                                NavigationCard(
                                  title: 'Favourites',
                                  color: AppColors.red,
                                  onPressed: () {
                                    _navigationToScreen(
                                        context: context,
                                        screen: const ScaffoldNavigationScreen(
                                          child: FavouriteScreen(),
                                        ));
                                  },
                                ),
                                NavigationCard(
                                  title: 'News',
                                  color: AppColors.blue,
                                  onPressed: () {
                                    _navigationToScreen(
                                        context: context,
                                        screen: const ScaffoldNavigationScreen(
                                          child: NewsScreen(),
                                        ));
                                  },
                                ),
                              ])
                            : PokemonGrid(pokemons: sortedPokemonsList)),
                  ],
                ),
              )
            : const LoadingWidget(),
      ),
    );
  }

  Widget _buildNavigationCards({required List<Widget> navigationCards}) {
    return Column(children: [
      const Spacer(),
      GridView.count(
        padding: const EdgeInsets.symmetric(vertical: 36),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        childAspectRatio: 2.58,
        mainAxisSpacing: 15,
        children: navigationCards,
      ),
      const Spacer(),
    ]);
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'What Pokemon\nare you looking for?',
            style: context.appTheme.typographies.headingLarge,
          ),
          _buildTextButton(
              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded,
                    size: context.appTheme.typographies.heading.fontSize,
                    color: context.appTheme.typographies.heading.color,
                  ),
                  _smallSpace(),
                  Text(
                    'Sign Out',
                    style: context.appTheme.typographies.heading,
                  )
                ],
              ),
              onTap: () {
                _navigationToScreen(
                    context: context, screen: const SignInScreen());
              })
        ],
      ),
    );
  }

  Widget _buildTextButton(
      {required Widget child, required VoidCallback onTap}) {
    return TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
        child: child);
  }

  Widget _smallSpace() {
    return const SizedBox(
      width: 12,
    );
  }
}
