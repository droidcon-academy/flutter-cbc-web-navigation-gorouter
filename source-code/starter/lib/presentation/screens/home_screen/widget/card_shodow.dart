import 'package:flutter/material.dart';

class CardShadow extends StatelessWidget {
  const CardShadow({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: color,
            offset: const Offset(0, 6),
            blurRadius: 23,
          ),
        ],
      ),
    );
  }
}
