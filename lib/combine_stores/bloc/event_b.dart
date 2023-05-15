part of 'bloc_b.dart';

abstract class EventB extends Equatable {
  const EventB();
}

class EventBFetch extends EventB {
  const EventBFetch();

  @override
  List<Object> get props => [];
}
