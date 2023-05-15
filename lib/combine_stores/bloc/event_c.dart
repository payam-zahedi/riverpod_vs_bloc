part of 'bloc_c.dart';

abstract class EventC extends Equatable {
  const EventC();
}

class EventCFetch extends EventC {
  const EventCFetch(this.message);

  final String message;
  @override
  List<Object> get props => [];
}
