
part of 'bloc_c.dart';

abstract class StateC extends Equatable {
  const StateC();
}

class StateCInitial extends StateC {
  const StateCInitial();

  @override
  List<Object> get props => [];
}

class StateCLoading extends StateC {
  const StateCLoading();

  @override
  List<Object> get props => [];
}

class StateCLoaded extends StateC {
  final String data;

  const StateCLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class StateCError extends StateC {
  final String message;

  const StateCError(this.message);

  @override
  List<Object> get props => [message];
}