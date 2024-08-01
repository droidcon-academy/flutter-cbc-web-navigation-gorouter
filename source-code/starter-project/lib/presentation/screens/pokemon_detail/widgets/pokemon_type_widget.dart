import 'package:flutter/material.dart';

import '../../../../models/data/pokemon_types.dart';

class PokemonType extends StatelessWidget {
  final PokemonTypes type;
  final bool large;

  const PokemonType({super.key, required this.type, this.large = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: type.color.withOpacity(0.2),
      ),
      child: Text(
        type.name.toUpperCase(),
        style: TextStyle(
          color: type.color,
          fontSize: large ? 16 : 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}