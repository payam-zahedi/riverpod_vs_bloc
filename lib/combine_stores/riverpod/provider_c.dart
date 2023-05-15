import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_vs_bloc/combine_stores/riverpod/provider_a.dart';
import 'package:riverpod_vs_bloc/combine_stores/riverpod/provider_b.dart';

final futureProviderC = FutureProvider<String>((ref) async {
  final providerA = ref.watch(futureProviderA);
  final providerB = ref.watch(futureProviderB);

  if (providerA.hasValue) {
    return providerA.asData!.value;
  }

  if (providerB.hasValue) {
    return providerB.asData!.value;
  }

  return '';
});
