part of 'rockets_cubit.dart';

sealed class RocketsState extends Equatable {
  final List<Rockets>? rockets;
  final String? error;

  const RocketsState({
    this.rockets,
    this.error,
  });

  @override
  List<Object> get props => [rockets!, error!];
}

class RocketsInitial extends RocketsState {
  const RocketsInitial();
}

class RocketsLoading extends RocketsState {
  const RocketsLoading();
}

class RocketsLoaded extends RocketsState {
  const RocketsLoaded(List<Rockets> rockets) : super(rockets: rockets);
}

class RocketsError extends RocketsState {
  final String errorMessage;

  const RocketsError(this.errorMessage) : super(error: errorMessage);
}
