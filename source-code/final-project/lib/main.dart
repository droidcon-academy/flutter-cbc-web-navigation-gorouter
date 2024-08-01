import 'package:flutter/material.dart';
import 'package:pokemon_navigation/core/auth/auth_service.dart';
import 'package:pokemon_navigation/core/data/pokemon_service.dart';
import 'package:pokemon_navigation/source/pokemon_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'router/router.dart';
import 'core/auth/auth_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  final sharedPreferences = await SharedPreferences.getInstance();
  final pokemonService = PokemonService(PokemonRepository());
  await pokemonService.loadPokemons();
  runApp(MyApp(
    sharedPreferences: sharedPreferences,
    pokemonService: pokemonService,
  ));
}

class MyApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;
  final PokemonService pokemonService;
  const MyApp({super.key, required this.sharedPreferences, required this.pokemonService});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
        Provider<AuthService>(
            create: (context) => AuthService(
                sharedPreferences: widget.sharedPreferences,
                authState: context.read<AuthState>())),
        Provider<PokemonService>.value(value: widget.pokemonService)
      ],
      child: Builder(
        builder: (context) {
          Provider.of<AuthService>(context, listen: false).bootCheck();
          final router = WebRouter(
            authState: Provider.of<AuthState>(context, listen: false),
          ).router;
          return MaterialApp.router(
            title: 'Pokemon Dashboard',
            debugShowCheckedModeBanner: false,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            routeInformationProvider: router.routeInformationProvider,
            backButtonDispatcher: router.backButtonDispatcher,
            builder: (context, child) => child!,
          );
        },
      ),
    );
  }
}