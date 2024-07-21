import 'package:flutter/material.dart';

import '../../../../models/data/pokemon.dart';
import '../../../../models/widget/pokemon_tab_data.dart';
import '../../../widgets/auto_slideup_panel.dart';
import '../tabs/pokemon_about_tab.dart';
import '../tabs/pokemon_base_stats_tab.dart';
import '../tabs/pokemon_evoluation_tab.dart';
import 'pokemon_tab_view.dart';

class PokemonInfoCard extends StatefulWidget {
  final Pokemon pokemon;
  static const double minCardHeightFraction = 0.54;

  const PokemonInfoCard({super.key, required this.pokemon});

  @override
  State<PokemonInfoCard> createState() => PokemonInfoCardState();
}

class PokemonInfoCardState extends State<PokemonInfoCard>
    with TickerProviderStateMixin {
  AnimationController get slideController => AnimationController(vsync: this);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final safeArea = MediaQuery.paddingOf(context);
    final appBarHeight = AppBar().preferredSize.height;

    final cardMinHeight = screenHeight * PokemonInfoCard.minCardHeightFraction;
    final cardMaxHeight = screenHeight - appBarHeight - safeArea.top;

    return AutoSlideUpPanel(
      minHeight: cardMinHeight,
      maxHeight: cardMaxHeight,
      onPanelSlide: (position) => slideController.value = position,
      child: PokemonTabView(
        paddingAnimation: slideController,
        tabs: [
          PokemonTabData(
            label: 'About',
            child: PokemonAbout(
              pokemon: widget.pokemon,
            ),
          ),
          PokemonTabData(
            label: 'Base Stats',
            child: PokemonBaseStats(
              pokemon: widget.pokemon,
            ),
          ),
          PokemonTabData(
            label: 'Evolution',
            child: PokemonEvolution(
              pokemon: widget.pokemon,
            ),
          ),
        ],
      ),
    );
  }
}
