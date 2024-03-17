// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on _MovieStore, Store {
  late final _$loadingAtom =
      Atom(name: '_MovieStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loadingTreadingAtom =
      Atom(name: '_MovieStore.loadingTreading', context: context);

  @override
  bool get loadingTreading {
    _$loadingTreadingAtom.reportRead();
    return super.loadingTreading;
  }

  @override
  set loadingTreading(bool value) {
    _$loadingTreadingAtom.reportWrite(value, super.loadingTreading, () {
      super.loadingTreading = value;
    });
  }

  late final _$movieDetailAtom =
      Atom(name: '_MovieStore.movieDetail', context: context);

  @override
  MovieDetail? get movieDetail {
    _$movieDetailAtom.reportRead();
    return super.movieDetail;
  }

  @override
  set movieDetail(MovieDetail? value) {
    _$movieDetailAtom.reportWrite(value, super.movieDetail, () {
      super.movieDetail = value;
    });
  }

  late final _$fetchMoviesAsyncAction =
      AsyncAction('_MovieStore.fetchMovies', context: context);

  @override
  Future<List<Movie>> fetchMovies(String type) {
    return _$fetchMoviesAsyncAction.run(() => super.fetchMovies(type));
  }

  late final _$fetchMoviesTrendingAsyncAction =
      AsyncAction('_MovieStore.fetchMoviesTrending', context: context);

  @override
  Future<List<Movie>> fetchMoviesTrending() {
    return _$fetchMoviesTrendingAsyncAction
        .run(() => super.fetchMoviesTrending());
  }

  late final _$fetchMovieDetailAsyncAction =
      AsyncAction('_MovieStore.fetchMovieDetail', context: context);

  @override
  Future<void> fetchMovieDetail(int id) {
    return _$fetchMovieDetailAsyncAction.run(() => super.fetchMovieDetail(id));
  }

  late final _$fetchMoviesSearchAsyncAction =
      AsyncAction('_MovieStore.fetchMoviesSearch', context: context);

  @override
  Future<List<Movie>> fetchMoviesSearch(String name) {
    return _$fetchMoviesSearchAsyncAction
        .run(() => super.fetchMoviesSearch(name));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
loadingTreading: ${loadingTreading},
movieDetail: ${movieDetail}
    ''';
  }
}
