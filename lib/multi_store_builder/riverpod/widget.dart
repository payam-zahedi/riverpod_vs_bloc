import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_vs_bloc/multi_store_builder/riverpod/provider.dart';

class ColorWidget extends ConsumerWidget {
  const ColorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final red = ref.watch(storeRProvider);
    final green = ref.watch(storeGProvider);
    final blue = ref.watch(storeBProvider);

    final color = Color.fromRGBO(red, green, blue, 1.0);

    return Container(
      width: 200,
      height: 200,
      color: color,
    );
  }
}
