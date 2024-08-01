import 'package:flutter/material.dart';
import 'package:pokemon_navigation/themes/extensions.dart';
import '../widgets/news_tlle.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(24),
          children: <Widget>[
            _buildHeading(context),
            _buildNewsList(),
          ],
        ));
  }

  Widget _buildNewsList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 9,
      separatorBuilder: (_, __) => const Divider(height: 24),
      itemBuilder: (_, __) {
        return const NewsListTile(
          title: 'Pokémon Rumble Rush Arrives Soon',
          time: '31 July 2024',
          thumbnail: AssetImage('assets/images/thumbnail.png'),
        );
      },
    );
  }

  Widget _buildHeading(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Pokémon News',
          style: context.typographies.heading,
        ),
        TextButton(
          onPressed: () {},
          style:
              TextButton.styleFrom(foregroundColor: context.colors.secondary),
          child: const Text('View All'),
        ),
      ],
    );
  }
}
