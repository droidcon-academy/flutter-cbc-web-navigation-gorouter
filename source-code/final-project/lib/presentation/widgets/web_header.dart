import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_navigation/constants/route_names.dart';
import 'package:pokemon_navigation/core/auth/auth_service.dart';
import 'package:pokemon_navigation/models/widget/header_link_data.dart';
import 'package:pokemon_navigation/themes/extensions.dart';
import 'package:provider/provider.dart';

class WebHeader extends StatelessWidget {
  final String title;
  final List<HeaderLinkData> headers;
  final double height;
  final double expandedTitleFontSize;
  final double expandedFontSize;

  static const TextStyle _boldTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: kToolbarHeight / 3,
    height: 1,
  );

  static const TextStyle _textStyle = TextStyle(
    fontSize: kToolbarHeight / 4,
    height: 1,
  );

  const WebHeader(
      {super.key,
      required this.title,
      required this.headers,
      this.height = 72,
      this.expandedTitleFontSize = 24,
      this.expandedFontSize = 16});

  ({
    TextStyle boldTextStyle,
    TextStyle textStyle,
    double boldFontSize,
    double fontSize
  }) _calculateTextStyles(BoxConstraints constraints, BuildContext context) {
    final safeAreaTop = MediaQuery.paddingOf(context).top;
    final minHeight = safeAreaTop + kToolbarHeight;
    final maxHeight = height + safeAreaTop;

    final percent =
        (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
    final boldFontSize = _boldTextStyle.fontSize ?? 16;
    final fontSize = _textStyle.fontSize ?? 12;
    final boldTextStyle = _boldTextStyle.copyWith(
        fontSize: fontSize + (expandedTitleFontSize - boldFontSize) * percent,
        color: context.appTheme.colors.textOnPrimary);
    final textStyle = _textStyle.copyWith(
        fontSize: fontSize + (expandedFontSize - fontSize) * percent,
        color: context.appTheme.colors.textOnPrimary);

    return (
      boldTextStyle: boldTextStyle,
      textStyle: textStyle,
      boldFontSize: boldFontSize,
      fontSize: fontSize
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: height,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        final currentStyles = _calculateTextStyles(constraints, context);
        return Container(
          padding: const EdgeInsets.all(20),
          decoration:
              BoxDecoration(color: context.colors.primary.withOpacity(0.9)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTextButton(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/pokeball.png',
                      width: currentStyles.boldFontSize,
                      height: currentStyles.boldFontSize,
                      color: context.appTheme.colors.textOnPrimary,
                      fit: BoxFit.contain,
                    ),
                    _smallSpace(),
                    Text(title, style: currentStyles.boldTextStyle),
                  ],
                ),
                onTap: () {
                  context.goNamed(Routes.homePage.name);
                },
              ),
              _largeSpace(),
              Row(
                children: headers.map((header) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _buildTextButton(
                        child:
                            Text(header.label, style: currentStyles.textStyle),
                        onTap: header.navigationCallBack),
                  );
                }).toList(),
              ),
              const Spacer(),
              _buildTextButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        size: currentStyles.fontSize,
                        color: currentStyles.textStyle.color,
                      ),
                      _smallSpace(),
                      Text(
                        'Sign Out',
                        style: currentStyles.textStyle,
                      )
                    ],
                  ),
                  onTap: () {
                    context.read<AuthService>().logOut();
                  })
            ],
          ),
        );
      }),
    );
  }

  Widget _buildTextButton(
      {required Widget child, required VoidCallback onTap}) {
    return TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
        child: child);
  }

  Widget _largeSpace() {
    return const SizedBox(
      width: 36,
    );
  }

  Widget _smallSpace() {
    return const SizedBox(
      width: 12,
    );
  }
}
