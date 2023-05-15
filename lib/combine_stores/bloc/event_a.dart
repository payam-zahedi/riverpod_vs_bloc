part of 'bloc_a.dart';

abstract class EventA extends Equatable {
  const EventA();
}

class EventAFetch extends EventA {
  const EventAFetch();

  @override
  List<Object> get props => [];
}
