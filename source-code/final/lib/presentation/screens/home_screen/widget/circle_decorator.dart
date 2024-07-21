import 'package:flutter/material.dart';

class CircleDecorator extends StatelessWidget {
  final double size;

  const CircleDecorator({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-size * 0.5, -size * 0.6),
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: Colors.white.withOpacity(0.14),
      ),
    );
  }
}
