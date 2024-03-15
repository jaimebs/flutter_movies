import 'package:dio/dio.dart';
import 'package:flutter_movies/src/models/movie.dart';

class MovieService {
  final Dio _dio = Dio();
  final String _baseUrl = "https://api.themoviedb.org/3";
  final String _apiKey = "e4d41550c7f045acb9ebb4fb201a17d3";

  Future<List<Movie>> fetchMovies(String type) async {
    try {
      final response = await _dio.get(
          "$_baseUrl/movie/$type?language=pt-BR&page=1",
          queryParameters: {'api_key': _apiKey});

      final movies = response.data['results'] as List;
      final moviesTranform =
          movies.map((item) => Movie.fromJson(item)).toList();

      return moviesTranform;
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }

  Future<List<Movie>> fetchMoviesTrending() async {
    try {
      final response = await _dio.get(
          "$_baseUrl/trending/movie/day?language=pt-BR",
          queryParameters: {'api_key': _apiKey});

      final movies = response.data['results'] as List;
      final moviesTranform =
          movies.map((item) => Movie.fromJson(item)).toList();

      return moviesTranform;
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }
}
