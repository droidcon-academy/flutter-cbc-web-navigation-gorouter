import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_navigation/update_metadata.dart';

import '../presentation/screens/pokemon_detail/pokemon_detail_screen.dart';
import '../presentation/screens/pokemons_screen.dart';
import '../constants/route_names.dart';
import '../presentation/screens/favourite_screen.dart';
import '../presentation/screens/home_screen/home_screen.dart';
import '../presentation/screens/news_screen.dart';
import '../core/auth/auth_state.dart';
import '../presentation/screens/error_page.dart';
import '../presentation/screens/scaffold_navigation_screen.dart';
import '../presentation/screens/sign_in_screen.dart';

class WebRouter {
  late final AuthState authState;
  GoRouter get router => _router;

  WebRouter({required this.authState});

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  late final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    refreshListenable: authState,
    initialLocation: Routes.homePage.path,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        name: Routes.signinRoute.name,
        path: Routes.signinRoute.path,
        builder: (context, state) {
          updatePageMetadata(Routes.signinRoute);
          return const SignInScreen();
        },
      ),
      GoRoute(
        name: Routes.homePage.name,
        path: Routes.homePage.path,
        builder: (context, state) {
          updatePageMetadata(Routes.homePage);
          return HomeScreen(search: state.uri.queryParameters['search'] ?? '');
        },
        routes: [
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return ScaffoldNavigationScreen(
                key: state.pageKey,
                child: child,
              );
            },
            routes: [
              GoRoute(
                  name: Routes.newsRoute.name,
                  path: Routes.newsRoute.path,
                  builder: (context, state) {
                    updatePageMetadata(Routes.newsRoute);
                    return const NewsScreen();
                  }),
              GoRoute(
                  name: Routes.favouriteRoute.name,
                  path: Routes.favouriteRoute.path,
                  builder: (context, state) {
                    updatePageMetadata(Routes.favouriteRoute);
                    return const FavouriteScreen();
                  }),
              GoRoute(
                name: Routes.pokemonsRoute.name,
                path: Routes.pokemonsRoute.path,
                builder: (context, state) {
                  updatePageMetadata(Routes.pokemonsRoute);
                  return const PokemonsSreen();
                },
              ),
            ],
          ),
          GoRoute(
              name: Routes.pokemonDetailRoute.name,
              path: Routes.pokemonDetailRoute.path,
              builder: (context, state) {
                final pokemonId = state.pathParameters['pokemonId']!;
                updatePageMetadata(Routes.pokemonDetailRoute,
                    dynamicData: {':pokemonId': pokemonId});
                return PokemonDetailScreen(id: pokemonId);
              }),
        ],
      ),
      GoRoute(
        name: Routes.noAccessRoute.name,
        path: Routes.noAccessRoute.path,
        builder: (context, state) {
          updatePageMetadata(Routes.noAccessRoute);
          return const PageNotFound();
        },
      ),
    ],
    errorBuilder: (context, state) {
      updatePageMetadata(Routes.noAccessRoute);
      return const PageNotFound();
    },
    redirect: _rootRedirectCheck,
  );

  FutureOr<String?> _rootRedirectCheck(
      BuildContext context, GoRouterState state) async {
    final loginLocation = state.namedLocation(Routes.signinRoute.name);
    final homeLocation = state.namedLocation(Routes.homePage.name);

    final loggedIn = authState.loginState;
    final appInitialized = authState.initialized;

    final isGoingToLogin = state.matchedLocation == loginLocation;

    // If not logedin and not going to login redirect to Login
    if (appInitialized && !loggedIn && !isGoingToLogin) {
      return loginLocation;
      // If all the scenarios are cleared but still going to any of that screen redirect to Home
    } else if (loggedIn && isGoingToLogin) {
      return homeLocation;
    } else {
      // Else Don't do anything
      return null;
    }
  }
}
