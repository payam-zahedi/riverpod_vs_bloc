import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_vs_bloc/common/movie_state.dart';
import 'package:riverpod_vs_bloc/network/repository.dart';
import 'package:riverpod_vs_bloc/riverpod/repository_provider.dart';

final movieNotifierProvider = StateNotifierProvider<MovieNotifier, MovieState>(
  (ref) => MovieNotifier(ref.watch(movieRepositoryProvider)),
);

class MovieNotifier extends StateNotifier<MovieState> {
  MovieNotifier(
    this.movieRepository,
  ) : super(MovieInitial());

  final MovieRepository movieRepository;

  void fetchMovie() async {
    state = MovieLoading();
    try {
      final movieList = await movieRepository.fetchMovieNames();
      state = MovieLoaded(movieList);
    } catch (e) {
      state = MovieError(e.toString());
    }
  }

  void removeMovie(String movieName) async {
    try {
      state = MovieLoading();
      await movieRepository.removeMovie(movieName);
      fetchMovie();
    } catch (e) {
      state = MovieError(e.toString());
    }
  }
}
