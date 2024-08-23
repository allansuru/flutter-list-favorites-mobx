import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../stores/characters/characters_store.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  getIt.registerLazySingleton(() => CharactersStore());
}
