part of 'ships_cubit.dart';

sealed class ShipsState extends Equatable {
  final List<Ships>? ships;
  final String? error;

  const ShipsState({
    this.ships,
    this.error,
  });

  @override
  List<Object> get props => [ships!, error!];
}

class ShipsInitial extends ShipsState {
  const ShipsInitial();
}

class ShipsLoading extends ShipsState {
  const ShipsLoading();
}

class ShipsLoaded extends ShipsState {
  const ShipsLoaded(List<Ships> ships) : super(ships: ships);
}

class ShipsError extends ShipsState {
  final String errorMessage;

  const ShipsError(this.errorMessage) : super(error: errorMessage);
}
