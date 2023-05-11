import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_vs_bloc/common/movie_state.dart';
import 'package:riverpod_vs_bloc/riverpod/future_provider.dart';
import 'package:riverpod_vs_bloc/riverpod/state_notifier.dart';

class MovieListStateNotifierWidget extends ConsumerWidget {
  const MovieListStateNotifierWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieList = ref.watch(movieNotifierProvider);

    if (movieList is MovieInitial) {
      return const Placeholder();
    } else if (movieList is MovieLoading) {
      return const CircularProgressIndicator();
    } else if (movieList is MovieLoaded) {
      return ListView.builder(
        itemCount: movieList.movieList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(movieList.movieList[index]),
          );
        },
      );
    } else if (movieList is MovieError) {
      return Text(movieList.message);
    }

    return Container();
  }
}

class MovieListFutureProviderWidget extends ConsumerWidget {
  const MovieListFutureProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieList = ref.watch(movieListFutureProvider);

    return movieList.when(
      data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index]),
            );
          },
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text(error.toString()),
    );
  }
}
