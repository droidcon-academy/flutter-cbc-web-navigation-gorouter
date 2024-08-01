import 'package:flutter/material.dart';

import '../../../../models/data/pokemon.dart';

class PokemonBaseStats extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonBaseStats({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Base Stats',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildStatsRow(
            label: 'HP',
            value: pokemon.hp.toString(),
          ),
          _buildStatsRow(
            label: 'Attack',
            value: pokemon.attack.toString(),
          ),
          _buildStatsRow(
            label: 'Defense',
            value: pokemon.defense.toString(),
          ),
          _buildStatsRow(
            label: 'Special Attack',
            value: pokemon.specialAttack.toString(),
          ),
          _buildStatsRow(
            label: 'Special Defense',
            value: pokemon.specialDefense.toString(),
          ),
          _buildStatsRow(
            label: 'Speed',
            value: pokemon.speed.toString(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
