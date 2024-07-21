import 'package:flutter/material.dart';
import 'package:pokemon_navigation/core/data/pokemon_service.dart';
import 'package:pokemon_navigation/presentation/widgets/loading_widget.dart';
import 'package:pokemon_navigation/themes/extensions.dart';
import 'package:provider/provider.dart';

import '../../../core/auth/auth_state.dart';
import 'widgets/background_decoration.dart';
import 'widgets/pokemon_info_cards.dart';
import 'widgets/pokemon_overall_info.dart';

class PokemonDetailScreen extends StatefulWidget {
  final String id;

  const PokemonDetailScreen({super.key, required this.id});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _rotateController;

  @override
  void initState() {
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonService = context.watch<PokemonService>();
    final authState = context.watch<AuthState>();
    final pokemon = pokemonService.getPokemonById(widget.id);
    return Scaffold(
        body: pokemonService.isLoaded && authState.initialized
            ? pokemon != null
                ? Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      BackgroundDecoration(
                        pokemon: pokemon,
                      ),
                      PokemonOverallInfo(
                        pokemon: pokemon,
                        slideController: _slideController,
                        rotationController: _rotateController,
                      ),
                      PokemonInfoCard(
                        pokemon: pokemon,
                      ),
                    ],
                  )
                : Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      BackgroundDecoration(
                        pokemon: pokemon,
                      ),
                      Center(
                        child: Text(
                          'Pokemon not found!',
                          style: context.appTheme.typographies.bodyLarge,
                        ),
                      )
                    ],
                  )
            : const LoadingWidget());
  }
}
