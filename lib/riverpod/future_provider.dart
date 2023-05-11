

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_vs_bloc/riverpod/repository_provider.dart';

final movieListFutureProvider = FutureProvider<List<String>>((ref) async {
  final movieRepository = ref.watch(movieRepositoryProvider);
  
  return movieRepository.fetchMovieNames();
});