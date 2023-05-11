import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_vs_bloc/network/repository.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepository();
});
