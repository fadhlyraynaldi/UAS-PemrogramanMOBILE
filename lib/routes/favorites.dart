// favorite_pokemon_list.dart

class FavoritePokemonList {
  static List<int> _favorites = [];

  static List<int> get favorites => List.from(_favorites);

  static bool isFavorite(int pokemonId) {
    return _favorites.contains(pokemonId);
  }

  static void toggleFavorite(int pokemonId) {
    if (_favorites.contains(pokemonId)) {
      _favorites.remove(pokemonId);
    } else {
      _favorites.add(pokemonId);
    }
  }
}
