import 'package:flutter_movies/src/models/movie.dart';
import 'package:flutter_movies/src/models/movie_detail.dart';
import 'package:flutter_movies/src/services/movie_service.dart';
import 'package:flutter_movies/src/utils/get_it_setup.dart';
import 'package:mobx/mobx.dart';
part 'movie_store.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  final movieService = getIt<MovieService>();

  @observable
  bool loading = false;

  @observable
  bool loadingTreading = false;

  @observable
  MovieDetail? movieDetail;

  @action
  Future<List<Movie>> fetchMovies(String type) async {
    try {
      loading = true;
      final response = await movieService.fetchMovies(type);
      return response;
    } catch (e) {
      throw Exception('Failed to fetchMovies: $e');
    } finally {
      loading = false;
    }
  }

  @action
  Future<List<Movie>> fetchMoviesTrending() async {
    try {
      loadingTreading = true;
      final response = await movieService.fetchMoviesTrending();
      return response;
    } catch (e) {
      throw Exception('Failed to fetchMoviesTrending: $e');
    } finally {
      loadingTreading = false;
    }
  }

  @action
  Future<void> fetchMovieDetail(int id) async {
    try {
      loading = true;
      final response = await movieService.fetchMovieDetail(id);
      movieDetail = response;
    } catch (e) {
      throw Exception('Failed to fetchMovieDetail: $e');
    } finally {
      loading = false;
    }
  }

  @action
  Future<List<Movie>> fetchMoviesSearch(String name) async {
    try {
      loading = true;
      final response = await movieService.fetchMoviesSearch(name);
      return response;
    } catch (e) {
      throw Exception('Failed to fetchMoviesSearch: $e');
    } finally {
      loading = false;
    }
  }
}
