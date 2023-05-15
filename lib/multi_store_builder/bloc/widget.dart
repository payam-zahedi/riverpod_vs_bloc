import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod_vs_bloc/multi_store_builder/bloc/cubits.dart';

class ColorDisplayWidget extends StatelessWidget {
  const ColorDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitR, int>(
      builder: (context, rColor) {
        return BlocBuilder<CubitG, int>(
          builder: (context, gColor) {
            return BlocBuilder<CubitB, int>(
              builder: (context, bColor) {
                final color = Color.fromRGBO(rColor, gColor, bColor, 1.0);
                return Container(
                  width: 200,
                  height: 200,
                  color: color,
                );
              },
            );
          },
        );
      },
    );
  }
}
