import 'package:flutter_bloc/flutter_bloc.dart';

class CubitR extends Cubit<int> {
  CubitR() : super(0);

  void setColorValue(int value) {
    emit(value);
  }
}

class CubitG extends Cubit<int> {
  CubitG() : super(0);

  void setColorValue(int value) {
    emit(value);
  }
}

class CubitB extends Cubit<int> {
  CubitB() : super(0);

  void setColorValue(int value) {
    emit(value);
  }
}