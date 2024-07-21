import 'package:flutter/material.dart';
import 'package:pokemon_navigation/themes/extensions.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.backgroundDark,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(children: [
            Center(
              child: Transform.scale(
                scale: 1.4,
                child: Image.asset(
                  'assets/images/pokeball.png',
                  width: 650,
                  height: 650,
                  color: Colors.grey.withOpacity(0.14),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/pika_loader.gif',
                width: 140,
                height: 140,
                fit: BoxFit.contain,
              ),
            ),
          ]),
        ));
  }
}
