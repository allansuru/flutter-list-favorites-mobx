import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../stores/characters/characters_store.dart';
import '../widgets/characterCard.dart';

class FavoritosPage extends StatelessWidget {
  final CharactersStore store = GetIt.instance<CharactersStore>();

  @override
  Widget build(BuildContext context) {
    print(store.favoriteCharacters);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Observer(
        builder: (_) {
          if (store.favoriteCharacters.isEmpty) {
            return const Center(
              child: Text('Nenhum item favoritado.'),
            );
          }

          return ListView.builder(
            itemCount: store.favoriteCharacters.length,
            itemBuilder: (context, index) {
              final character = store.favoriteCharacters[index];
              return CharacterCard(character: character, store: store);
            },
          );
        },
      ),
    );
  }
}
