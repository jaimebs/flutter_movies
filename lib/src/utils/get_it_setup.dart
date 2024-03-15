import 'package:flutter_movies/src/services/movie_service.dart';
import 'package:flutter_movies/src/stores/movie_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;
void setupGetIt() {
  getIt.registerSingleton<MovieService>(MovieService());
  getIt.registerSingleton<MovieStore>(MovieStore());
}
