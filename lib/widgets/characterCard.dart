import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../models/character.dart';
import '../stores/characters/characters_store.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final CharactersStore store;

  const CharacterCard({Key? key, required this.character, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    character.image,
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                character.name,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center, // Centraliza o texto
              ),
              const SizedBox(height: 4),
              Center(
                child: Text(
                  character.species,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.amber, // Aplica a cor ao texto
                      ),
                  textAlign: TextAlign.center, // Centraliza o texto
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Observer(
              builder: (_) => IconButton(
                icon: Icon(
                  store.isFavorite(character.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: store.isFavorite(character.id)
                      ? Colors.red
                      : Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  store.toggleFavorite(character);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
