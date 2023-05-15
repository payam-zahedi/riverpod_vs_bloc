import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event_a.dart';
part 'state_a.dart';

class BlocA extends Bloc<EventA, StateA> {
  BlocA() : super(const StateAInitial()) {
    on<EventAFetch>((event, emit) async {
      emit(const StateALoading());

      await Future.delayed(const Duration(seconds: 1));

      emit(const StateALoaded('BlocA'));
    });
  }
}
