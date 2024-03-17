import 'package:flutter/material.dart';
import 'package:flutter_movies/src/components/movie_card.dart';
import 'package:flutter_movies/src/components/movie_search.dart';
import 'package:flutter_movies/src/models/movie.dart';
import 'package:flutter_movies/src/pages/movie_detail.dart';
import 'package:flutter_movies/src/pages/movie_search.dart';
import 'package:flutter_movies/src/stores/movie_store.dart';
import 'package:flutter_movies/src/utils/date_format.dart';
import 'package:flutter_movies/src/utils/get_it_setup.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textSearchController = TextEditingController();
  final _movieStore = getIt<MovieStore>();
  late List<Movie> moviesPopular;
  late List<Movie> moviesTrending;

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  Future getMovies() async {
    moviesPopular = await _movieStore.fetchMovies("popular");
  }

  Future getMoviesTrending() async {
    moviesPopular = await _movieStore.fetchMoviesTrending();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Observer(
        builder: (_) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0XFF032541),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9ghFe_m2puuK5MT1i__4bSjHf3gNjLQZAGg&usqp=CAU",
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Text(
                      "Bem-Vindo(a).",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Milhões de Filmes, Séries e Pessoas para Descobrir. Explore já.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MovieSearch(
                    textSearchController: _textSearchController,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieSearchPage(
                            movieName: _textSearchController.text,
                          ),
                        ),
                      );
                    },
                  )),
              Padding(
                padding: const EdgeInsets.all(8),
                child: _movieStore.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Os Mais Populares",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 400,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: moviesPopular.length,
                                itemBuilder: (context, index) {
                                  final movie = moviesPopular[index];
                                  return Column(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MovieDetailPage(
                                                  movieId: movie.id,
                                                ),
                                              ),
                                            );
                                          },
                                          child: MovieCard(
                                              posterPath: movie.posterPath)),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        movie.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        formatDate(movie.releaseDate),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
