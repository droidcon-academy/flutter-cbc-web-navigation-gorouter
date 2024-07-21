import 'package:flutter/material.dart';
import 'package:pokemon_navigation/themes/extensions.dart';

import 'card_shodow.dart';
import 'circle_decorator.dart';
import 'pokeball_decorator.dart';

class NavigationCard extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onPressed;

  const NavigationCard({
    super.key,
    required this.title,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final height = constraints.maxHeight;
      return Stack(
        children: [
          _buildCardShadow(),
          FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: color,
              disabledBackgroundColor: color,
              disabledForegroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: ClipRRect(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  _buildCircleDecorator(height),
                  _buildPokeballDecorator(height),
                  _buildCardText(context),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildCardShadow() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CardShadow(color: color),
    );
  }

  Widget _buildCardText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: context.typographies.body.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildPokeballDecorator(double height) {
    return Align(
      alignment: Alignment.centerRight,
      child: PokeballDecorator(size: height),
    );
  }

  Widget _buildCircleDecorator(double height) {
    return Align(
      alignment: Alignment.topLeft,
      child: CircleDecorator(size: height),
    );
  }
}
