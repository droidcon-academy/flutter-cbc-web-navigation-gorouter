import 'package:flutter/material.dart';
import 'package:pokemon_navigation/themes/extensions.dart';
import 'package:provider/provider.dart';

import '../../core/auth/auth_state.dart';
import '../widgets/loading_widget.dart';
import '../widgets/news_tlle.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthState>();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: authState.initialized
            ? ListView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.all(24),
                children: <Widget>[
                  _buildHeading(context),
                  _buildNewsList(),
                ],
              )
            : const LoadingWidget());
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
          time: '15 May 2019',
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
