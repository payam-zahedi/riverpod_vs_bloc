import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event_b.dart';
part 'state_b.dart';

class BlocB extends Bloc<EventB, StateB> {
  BlocB() : super(const StateBInitial()) {
    on<EventBFetch>((event, emit) async {
      emit(const StateBLoading());

      await Future.delayed(const Duration(seconds: 1));

      emit(const StateBLoaded('BlocB'));
    });
  }
}
