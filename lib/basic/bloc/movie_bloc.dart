// movie bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod_vs_bloc/basic/common/movie_event.dart';
import 'package:riverpod_vs_bloc/basic/common/movie_state.dart';

import '../network/repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc({required this.movieRepository}) : super(MovieInitial()) {
    on<FetchMovie>(_onFetchMovie);
    on<RemoveMovie>(_onRemoveMovie);
  }

  void _onFetchMovie(FetchMovie event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movieList = await movieRepository.fetchMovieNames();
      emit(MovieLoaded(movieList));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  void _onRemoveMovie(RemoveMovie event, Emitter<MovieState> emit) async {
    try {
      emit(MovieLoading());
      await movieRepository.removeMovie(event.movieName);
      add(FetchMovie());
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}
