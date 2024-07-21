import 'package:flutter/material.dart';

class PokeballDecorator extends StatelessWidget {
  final double size;

  const PokeballDecorator({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.4,
      child: Image.asset(
        'assets/images/pokeball.png',
        width: size,
        height: size,
        color: Colors.white.withOpacity(0.14),
        fit: BoxFit.contain,
      ),
    );
  }
}
