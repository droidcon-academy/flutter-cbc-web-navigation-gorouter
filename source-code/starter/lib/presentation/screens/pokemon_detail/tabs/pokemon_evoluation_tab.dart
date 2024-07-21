import 'package:flutter/material.dart';
import '../../../../models/data/pokemon.dart';

class PokemonEvolution extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonEvolution({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Evolution',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          if (pokemon.evolvedfrom.isNotEmpty)
            _buildEvolutionItem(context, 'Evolved from', pokemon.evolvedfrom),
          if (pokemon.evolutions.isNotEmpty)
            _buildEvolutionItem(
                context, 'Evolves to', pokemon.evolutions.join(', ')),
          if (pokemon.evolvedfrom.isEmpty && pokemon.evolutions.isEmpty)
            Text(
              'This Pokémon does not evolve.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
        ],
      ),
    );
  }

  Widget _buildEvolutionItem(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
