import 'package:flutter/material.dart';
import 'package:pokemon_navigation/themes/colors.dart';
import 'package:pokemon_navigation/themes/extensions.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '404 - Not Found',
                style: context.typographies.bodyLarge
                    .withColor(context.colors.text)
                    .withWeight(FontWeight.bold),
              ),
              const SizedBox(height: 64),
              // Pokeball Icon
              Transform.scale(
                scale: 1.4,
                child: Image.asset(
                  'assets/images/pokeball.png',
                  width: 150,
                  height: 150,
                  color: AppColors.red,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 52),
              Text(
                'Oops! The Pokemon you\'re looking for is lost in the wild.',
                style: context.typographies.body
                    .withColor(context.colors.text)
                    .withWeight(FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'It seems like this page doesn\'t exist. Try searching again or going back.',
                style: context.typographies.body
                    .withColor(context.colors.hint)
                    .withWeight(FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
