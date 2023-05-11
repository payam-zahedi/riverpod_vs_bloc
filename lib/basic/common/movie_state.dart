import 'package:equatable/equatable.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoading extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoaded extends MovieState {
  final List<String> movieList;

  const MovieLoaded([this.movieList = const []]);

  @override
  List<Object> get props => [movieList];

  @override
  String toString() => 'MovieLoaded { movieList: $movieList }';
}

class MovieError extends MovieState {
  final String message;

  const MovieError(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'MovieError { message: $message }';
}
