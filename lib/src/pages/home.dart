import 'package:flutter/material.dart';
import 'package:flutter_movies/src/models/movie.dart';
import 'package:flutter_movies/src/pages/movie_detail.dart';
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
  final movieStore = getIt<MovieStore>();
  late List<Movie> moviesPopular;
  late List<Movie> moviesTrending;

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  Future getMovies() async {
    moviesPopular = await movieStore.fetchMovies("popular");
  }

  Future getMoviesTrending() async {
    moviesPopular = await movieStore.fetchMoviesTrending();
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText:
                                  'Buscar por um Filme, Série ou Pessoa...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          // Função a ser executada quando o botão for pressionado
                        },
                        height: 48,
                        color: const Color(0XFF032541),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text('Buscar'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: movieStore.loading
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
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          width: 200,
                                          height: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://media.themoviedb.org/t/p/w220_and_h330_face${movie.posterPath}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
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
