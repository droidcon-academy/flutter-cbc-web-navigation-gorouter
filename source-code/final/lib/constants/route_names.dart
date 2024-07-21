class Routes {
  static const signinRoute = Route(
    name: 'signinRoute',
    path: '/signin',
    metadata: {
      'title': 'Sign In - Pokedex App',
      'description': 'Access your Pokedex account to track your favorite Pokemon, sync your data across devices, and enjoy personalized features.',
      'url': 'https://www.yourpokedexapp.com/signin',
      'image': 'https://www.yourpokedexapp.com/images/signin-banner.jpg'
    }
  );

  static const homePage = Route(
    name: 'homePage',
    path: '/',
    metadata: {
      'title': 'Pokedex App - Explore the World of Pokemon',
      'description': "Explore the vast world of Pokémon with our comprehensive Pokedex app. Discover detailed information on all Pokémon species, including their types, abilities, evolutions, and stats. Whether you're a seasoned trainer or new to the Pokémon universe, our user-friendly interface makes it easy to search, filter, and learn about your favorite creatures.",
      'url': 'https://www.yourpokedexapp.com',
      'image': 'https://www.yourpokedexapp.com/images/homepage-banner.jpg'
    }
  );

  static const newsRoute = Route(
    name: 'newsRoute',
    path: 'news',
    metadata: {
      'title': 'Pokemon News - Latest Updates | Pokedex App',
      'description': 'Stay up-to-date with the latest Pokemon news, game updates, and community events. Get insights on new Pokemon, strategies, and more.',
      'url': 'https://www.yourpokedexapp.com/news',
      'image': 'https://www.yourpokedexapp.com/images/news-banner.jpg'
    }
  );

  static const favouriteRoute = Route(
    name: 'favouriteRoute',
    path: 'favourites',
    metadata: {
      'title': 'Your Favorite Pokemon | Pokedex App',
      'description': 'Access your personalized list of favorite Pokemon. Quickly view and manage your most beloved creatures in one place.',
      'url': 'https://www.yourpokedexapp.com/favourites',
      'image': 'https://www.yourpokedexapp.com/images/favourites-banner.jpg'
    }
  );

  static const pokemonsRoute = Route(
    name: 'pokemonRoute',
    path: 'pokemons',
    metadata: {
      'title': 'Pokemon List - Complete Pokedex | Pokedex App',
      'description': 'Browse our complete Pokedex featuring all Pokemon species. Search, filter, and discover detailed information about every Pokemon.',
      'url': 'https://www.yourpokedexapp.com/pokemons',
      'image': 'https://www.yourpokedexapp.com/images/pokemons-list-banner.jpg'
    }
  );

  static const pokemonDetailRoute = Route(
    name: 'pokemonDetailsRoute',
    path: 'pokemons/:pokemonId',
    metadata: {
      'title': 'Pokemon :pokemonId - Pokedex App',
      'description': 'Discover detailed information about Pokemon including stats, abilities, evolutions, and more. Enhance your Pokemon knowledge with our comprehensive Pokedex.',
      'url': 'https://www.yourpokedexapp.com/pokemon/:pokemonId',
      'image': 'https://www.yourpokedexapp.com/images/pokemon/:pokemonId.jpg'
    }
  );

  static const aboutRoute = Route(
    name: 'aboutRoute',
    path: 'pokemons/:pokemonId/about',
    metadata: {
      'title': 'About :pokemonName | Pokemon Details | Pokedex App',
      'description': 'Learn about :pokemonName\'s characteristics, habitat, and behavior. Explore the lore and background of this fascinating Pokemon species.',
      'url': 'https://www.yourpokedexapp.com/pokemon/:pokemonId/about',
      'image': 'https://www.yourpokedexapp.com/images/pokemon/:pokemonId-about.jpg'
    }
  );

  static const baseStatsRoute = Route(
    name: 'baseStatsRoute',
    path: 'pokemons/:pokemonId/base-stats',
    metadata: {
      'title': ':pokemonName Base Stats | Pokemon Details | Pokedex App',
      'description': 'Analyze :pokemonName\'s base stats including HP, Attack, Defense, Speed, and more. Compare stats and understand this Pokemon\'s strengths.',
      'url': 'https://www.yourpokedexapp.com/pokemon/:pokemonId/base-stats',
      'image': 'https://www.yourpokedexapp.com/images/pokemon/:pokemonId-stats.jpg'
    }
  );

  static const evolutionRoute = Route(
    name: 'evolutionRoute',
    path: 'pokemons/:pokemonId/evolution',
    metadata: {
      'title': ':pokemonName Evolution Chain | Pokemon Details | Pokedex App',
      'description': 'Explore :pokemonName\'s complete evolution chain. Learn about evolution methods, levels, and see all forms in this Pokemon\'s evolutionary line.',
      'url': 'https://www.yourpokedexapp.com/pokemon/:pokemonId/evolution',
      'image': 'https://www.yourpokedexapp.com/images/pokemon/:pokemonId-evolution.jpg'
    }
  );

  static const noAccessRoute = Route(
    name: 'noAccessRoute',
    path: '/no-access-route',
    metadata: {
      'title': 'Access Denied | Pokedex App',
      'description': '404 Page',
      'url': 'https://www.yourpokedexapp.com/no-access-route',
      'image': 'https://www.yourpokedexapp.com/images/no-access-banner.jpg'
    }
  );
}

class Route {
  final String name;
  final String path;
  final Map<String, String> metadata;

  const Route({
    required this.name,
    required this.path,
    required this.metadata,
  });
}