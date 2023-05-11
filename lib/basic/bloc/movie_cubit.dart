import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod_vs_bloc/basic/common/movie_state.dart';
import 'package:riverpod_vs_bloc/basic/network/repository.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository movieRepository;

  MovieCubit({required this.movieRepository}) : super(MovieInitial());

  void onFetchMovie() async {
    emit(MovieLoading());
    try {
      final movieList = await movieRepository.fetchMovieNames();
      emit(MovieLoaded(movieList));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  void onRemoveMovie(String movieName) async {
    try {
      emit(MovieLoading());
      await movieRepository.removeMovie(movieName);
      onFetchMovie();
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}
