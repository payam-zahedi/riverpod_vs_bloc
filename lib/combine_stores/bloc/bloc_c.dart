import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod_vs_bloc/combine_stores/bloc/bloc_a.dart';
import 'package:riverpod_vs_bloc/combine_stores/bloc/bloc_b.dart';

part 'event_c.dart';
part 'state_c.dart';

class BlocC extends Bloc<EventC, StateC> {
  final BlocA blocA;
  final BlocB blocB;

  late final StreamSubscription<StateA> _blocAStreamSubscription;
  late final StreamSubscription<StateB> _blocBStreamSubscription;

  BlocC(
    this.blocA,
    this.blocB,
  ) : super(const StateCInitial()) {
    on<EventCFetch>((event, emit) async {
      emit(StateCLoaded(event.message));
    });

    _blocAStreamSubscription = blocA.stream.listen((state) {
      if (state is StateALoaded) {
        add(EventCFetch(state.data));
      }
    });

    _blocBStreamSubscription = blocB.stream.listen((state) {
      if (state is StateBLoaded) {
        add(EventCFetch(state.data));
      }
    });
  }

  @override
  Future<void> close() {
    _blocAStreamSubscription.cancel();
    _blocBStreamSubscription.cancel();
    return super.close();
  }
}
