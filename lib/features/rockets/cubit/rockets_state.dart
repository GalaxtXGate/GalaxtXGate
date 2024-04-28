part of 'rockets_cubit.dart';

sealed class RocketsState extends Equatable {
  final List<RocketsModel>? rockets;
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
  const RocketsLoaded(List<RocketsModel> crews) : super(rockets: crews);
}

class RocketsError extends RocketsState {
  final String errorMessage;

  const RocketsError(this.errorMessage) : super(error: errorMessage);
}
