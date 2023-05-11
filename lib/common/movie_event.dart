// Movie bloc events

import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

// fetch movie names
class FetchMovie extends MovieEvent {
  @override
  List<Object> get props => [];
}

// remove movie
class RemoveMovie extends MovieEvent {
  final String movieName;

  const RemoveMovie(this.movieName);

  @override
  List<Object> get props => [movieName];
}
