import 'package:flutter/material.dart';

import '../../../../themes/extensions.dart';

class PokemonSearchBar extends StatelessWidget {
  final String hintText;
  final bool enabled;
  final TextEditingController textController;

  const PokemonSearchBar({
    super.key,
    required this.textController,
    this.hintText = '',
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 770,
      decoration: BoxDecoration(
        color: context.colors.backgroundDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        enabled: enabled,
        controller: textController,
        style: context.typographies.body,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: context.typographies.body.copyWith(
            color: context.colors.hint,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 18,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black54,
          ),
          suffixIcon: enabled
              ? IconButton(
                  onPressed: () {
                    textController.clear();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black54,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
