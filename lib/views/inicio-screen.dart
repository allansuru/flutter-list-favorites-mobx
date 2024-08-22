import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../stores/characters/characters_store.dart';
import '../widgets/pesquisar.dart';
import '../widgets/characterCard.dart';

class InicioPage extends StatelessWidget {
  final CharactersStore store = GetIt.instance<CharactersStore>();
  final TextEditingController _searchController = TextEditingController();

  void _onSearch(String query) {
    store.fetchCharacters(query: query);
  }

  @override
  Widget build(BuildContext context) {
    store.fetchCharacters();
    return Scaffold(
      appBar: AppBar(
        title: Text('Personagens'),
      ),
      body: Column(
        children: [
          Pesquisar(
            searchController: _searchController,
            onSearch: _onSearch,
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                if (store.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (store.characters.isEmpty) {
                  return const Center(
                      child: Text('Nenhum personagem encontrado.'));
                } else {
                  return ListView.builder(
                    itemCount: store.characters.length,
                    itemBuilder: (context, index) {
                      final character = store.characters[index];
                      return CharacterCard(
                        character: character,
                        store: store,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
