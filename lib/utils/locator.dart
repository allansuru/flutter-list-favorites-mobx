import 'package:get_it/get_it.dart';
import '../stores/characters/characters_store.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => CharactersStore());
}
