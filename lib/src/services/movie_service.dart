import 'package:dio/dio.dart';
import 'package:flutter_movies/src/models/movie.dart';
import 'package:flutter_movies/src/models/movie_detail.dart';

class MovieService {
  final Dio _dio = Dio();
  final String _baseUrl = "https://api.themoviedb.org/3";
  final String _apiKey = "e4d41550c7f045acb9ebb4fb201a17d3";

  Future<List<Movie>> fetchMovies(String type) async {
    try {
      final response = await _dio.get(
          "$_baseUrl/movie/$type?language=pt-BR&page=1",
          queryParameters: {'api_key': _apiKey});

      final data = response.data['results'] as List;
      final movies = data.map((item) => Movie.fromJson(item)).toList();

      return movies;
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }

  Future<List<Movie>> fetchMoviesTrending() async {
    try {
      final response = await _dio.get(
          "$_baseUrl/trending/movie/day?language=pt-BR",
          queryParameters: {'api_key': _apiKey});

      final data = response.data['results'] as List;
      final movies = data.map((item) => Movie.fromJson(item)).toList();

      return movies;
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }

  Future<MovieDetail> fetchMovieDetail(int id) async {
    try {
      final response = await _dio.get("$_baseUrl/movie/$id?language=pt-BR",
          queryParameters: {'api_key': _apiKey});

      return MovieDetail.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }

  Future<List<Movie>> fetchMoviesSearch(String name) async {
    try {
      final response = await _dio.get(
          "$_baseUrl/search/movie?query=$name&include_adult=false&language=pt-BR&page=1",
          queryParameters: {'api_key': _apiKey});

      final data = response.data['results'] as List;
      final movies = data.map((item) => Movie.fromJson(item)).toList();

      return movies;
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }
}
