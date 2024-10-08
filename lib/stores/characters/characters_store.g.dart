// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on _CharactersStoreBase, Store {
  late final _$charactersAtom =
      Atom(name: '_CharactersStoreBase.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CharactersStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CharactersStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$favoriteCharactersAtom =
      Atom(name: '_CharactersStoreBase.favoriteCharacters', context: context);

  @override
  ObservableList<Character> get favoriteCharacters {
    _$favoriteCharactersAtom.reportRead();
    return super.favoriteCharacters;
  }

  @override
  set favoriteCharacters(ObservableList<Character> value) {
    _$favoriteCharactersAtom.reportWrite(value, super.favoriteCharacters, () {
      super.favoriteCharacters = value;
    });
  }

  late final _$fetchCharactersAsyncAction =
      AsyncAction('_CharactersStoreBase.fetchCharacters', context: context);

  @override
  Future<void> fetchCharacters({String? query}) {
    return _$fetchCharactersAsyncAction
        .run(() => super.fetchCharacters(query: query));
  }

  late final _$_CharactersStoreBaseActionController =
      ActionController(name: '_CharactersStoreBase', context: context);

  @override
  void toggleFavorite(Character character) {
    final _$actionInfo = _$_CharactersStoreBaseActionController.startAction(
        name: '_CharactersStoreBase.toggleFavorite');
    try {
      return super.toggleFavorite(character);
    } finally {
      _$_CharactersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
characters: ${characters},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
favoriteCharacters: ${favoriteCharacters}
    ''';
  }
}
