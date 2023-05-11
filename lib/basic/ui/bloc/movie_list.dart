import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod_vs_bloc/basic/bloc/movie_bloc.dart';
import 'package:riverpod_vs_bloc/basic/bloc/movie_cubit.dart';
import 'package:riverpod_vs_bloc/basic/common/movie_state.dart';
import 'package:riverpod_vs_bloc/basic/network/repository.dart';

class MovieListBlocWidget extends StatelessWidget {
  const MovieListBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      bloc: MovieBloc(movieRepository: MovieRepository()),
      builder: (context, state) {
        if (state is MovieInitial) {
          return const Placeholder();
        } else if (state is MovieLoading) {
          return const CircularProgressIndicator();
        } else if (state is MovieLoaded) {
          return ListView.builder(
            itemCount: state.movieList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.movieList[index]),
              );
            },
          );
        } else if (state is MovieError) {
          return Text(state.message);
        }

        return Container();
      },
    );
  }
}

class MovieListCubitWidget extends StatelessWidget {
  const MovieListCubitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      bloc: MovieCubit(movieRepository: MovieRepository()),
      builder: (context, state) {
        if (state is MovieInitial) {
          return const Placeholder();
        } else if (state is MovieLoading) {
          return const CircularProgressIndicator();
        } else if (state is MovieLoaded) {
          return ListView.builder(
            itemCount: state.movieList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.movieList[index]),
              );
            },
          );
        } else if (state is MovieError) {
          return Text(state.message);
        }

        return Container();
      },
    );
  }
}

class MovieListBlocSelectorWidget extends StatelessWidget {
  const MovieListBlocSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MovieBloc, MovieState, List<String>>(
      bloc: MovieBloc(movieRepository: MovieRepository()),
      selector: (state) => state is MovieLoaded ? state.movieList : [],
      builder: (context, movieList) {
        return ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(movieList[index]),
            );
          },
        );
      },
    );
  }
}
