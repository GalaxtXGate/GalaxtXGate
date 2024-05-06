part of 'crews_cubit.dart';

@immutable
sealed class CrewsState extends Equatable {
  final List<CrewModel>? crews;
  final String? error;

  const CrewsState({
    this.crews,
    this.error,
  });

  @override
  List<Object> get props => [crews!, error!];
}

class CrewsInitial extends CrewsState {
  const CrewsInitial();
}

class CrewsLoading extends CrewsState {
  const CrewsLoading();
}

class CrewsLoaded extends CrewsState {
  const CrewsLoaded(List<CrewModel> crews) : super(crews: crews);
}

class CrewsError extends CrewsState {
  final String errorMessage;

  const CrewsError(this.errorMessage) : super(error: errorMessage);
}
