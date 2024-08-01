import 'dart:math';

import 'package:flutter/material.dart';

class PositionedPokeball extends StatelessWidget {
  final double widthFraction;
  final double maxSize;

  const PositionedPokeball({
    super.key,
    this.widthFraction = 0.664,
    this.maxSize = 250,
  });

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.paddingOf(context).top;
    final pokeballSize =
        min(MediaQuery.sizeOf(context).width * widthFraction, maxSize);
    final iconButtonPadding = const EdgeInsets.symmetric(horizontal: 24).right;
    final iconSize = IconTheme.of(context).size ?? 0;

    final pokeballTopMargin =
        -(pokeballSize / 2 - safeAreaTop - kToolbarHeight / 2);
    final pokeballRightMargin =
        -(pokeballSize / 2 - iconButtonPadding - iconSize / 2);

    return Positioned(
      top: pokeballTopMargin,
      right: pokeballRightMargin,
      child: SizedBox(
          width: pokeballSize,
          height: pokeballSize,
          child: Transform.scale(
            scale: 1.4,
            child: Image.asset(
              'assets/images/pokeball.png',
              width: 70,
              height: 70,
              color: Colors.grey.withOpacity(0.14),
              fit: BoxFit.contain,
            ),
          )),
    );
  }
}
