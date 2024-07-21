import 'package:flutter/material.dart';

import '../../../../models/data/pokemon.dart';

class PokemonAbout extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonAbout({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            pokemon.description,
          ),
        ],
      ),
    );
  }
}
