
part of 'bloc_a.dart';

abstract class StateA extends Equatable {
  const StateA();
}

class StateAInitial extends StateA {
  const StateAInitial();

  @override
  List<Object> get props => [];
}

class StateALoading extends StateA {
  const StateALoading();

  @override
  List<Object> get props => [];
}

class StateALoaded extends StateA {
  final String data;

  const StateALoaded(this.data);

  @override
  List<Object> get props => [data];
}

class StateAError extends StateA {
  final String message;

  const StateAError(this.message);

  @override
  List<Object> get props => [message];
}