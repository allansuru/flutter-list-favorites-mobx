import 'package:mobx/mobx.dart';
import '../../models/character.dart';
import '../../services/http_api.dart'; // Atualize o caminho conforme necessário

part 'characters_store.g.dart';

class CharactersStore = _CharactersStoreBase with _$CharactersStore;

abstract class _CharactersStoreBase with Store {
  final HttpApi api = HttpApi();

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<Character> favoriteCharacters = ObservableList<Character>();

  @action
  Future<void> fetchCharacters({String? query}) async {
    isLoading = true;
    try {
      final response = await api.getRequest('character',
          queryParams: query != null ? {'name': query} : null);
      final results = response['results'] as List<dynamic>;
      characters.clear();
      characters
          .addAll(results.map((item) => Character.fromJson(item)).toList());
    } catch (e) {
      // Handle errors
    } finally {
      isLoading = false;
    }
  }

  @action
  void toggleFavorite(Character character) {
    if (isFavorite(character.id)) {
      favoriteCharacters.removeWhere((c) => c.id == character.id);
    } else {
      favoriteCharacters.add(character);
    }
    print(favoriteCharacters);
  }

  bool isFavorite(int characterId) {
    return favoriteCharacters.any((character) => character.id == characterId);
  }
}
