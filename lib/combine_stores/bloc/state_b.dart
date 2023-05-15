
part of 'bloc_b.dart';

abstract class StateB extends Equatable {
  const StateB();
}

class StateBInitial extends StateB {
  const StateBInitial();

  @override
  List<Object> get props => [];
}

class StateBLoading extends StateB {
  const StateBLoading();

  @override
  List<Object> get props => [];
}

class StateBLoaded extends StateB {
  final String data;

  const StateBLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class StateBError extends StateB {
  final String message;

  const StateBError(this.message);

  @override
  List<Object> get props => [message];
}