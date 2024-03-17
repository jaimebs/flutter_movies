import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_movies/src/components/movie_card.dart';
import 'package:flutter_movies/src/stores/movie_store.dart';
import 'package:flutter_movies/src/utils/date_format.dart';
import 'package:flutter_movies/src/utils/get_it_setup.dart';
import 'package:flutter_movies/src/utils/time_format.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _movieStore = getIt<MovieStore>();

  @override
  void initState() {
    _movieStore.fetchMovieDetail(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0XFF032541),
        title: const Text("Detalhe do Filme"),
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) => _movieStore.loading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: MovieCard(
                            posterPath: _movieStore.movieDetail!.posterPath,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            '${_movieStore.movieDetail!.title} (${getYearOfDate(_movieStore.movieDetail!.releaseDate)})',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                formatToDdMmYyyy(
                                    _movieStore.movieDetail!.releaseDate),
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.grey,
                                  size: 6,
                                ),
                              ),
                              Text(
                                _movieStore.movieDetail!.genres
                                    .map((e) => e.name)
                                    .join(', '),
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.grey,
                                  size: 6,
                                ),
                              ),
                              Text(
                                formatMinutesToTimeString(
                                    _movieStore.movieDetail!.runtime),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        if (_movieStore.movieDetail!.tagline.isNotEmpty) ...[
                          Text(
                            _movieStore.movieDetail!.tagline,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                            ),
                          ),
                        ] else ...[
                          const SizedBox.shrink()
                        ],
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Sinopse",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          _movieStore.movieDetail!.overview,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
