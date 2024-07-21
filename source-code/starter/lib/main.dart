import 'package:flutter/material.dart';
import 'package:pokemon_navigation/core/data/pokemon_service.dart';
import 'package:pokemon_navigation/presentation/screens/sign_in_screen.dart';
import 'package:pokemon_navigation/source/pokemon_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  const MyApp(
      {super.key,
      required this.sharedPreferences,
      required this.pokemonService});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<PokemonService>.value(value: widget.pokemonService)],
      child: Builder(
        builder: (context) {
          return const MaterialApp(
            title: 'Pokemon Dashboard',
            debugShowCheckedModeBanner: false,
            home: SignInScreen(),
          );
        },
      ),
    );
  }
}
