part of 'launches_cubit.dart';

sealed class LaunchesState {}

final class LaunchesInitial extends LaunchesState {}

final class GetLaunchesLoading extends LaunchesState {}

final class GetLaunchesSuccess extends LaunchesState {
  List<Launche> launchesModel;
  GetLaunchesSuccess({required this.launchesModel});
}

final class GetLaunchesFailuer extends LaunchesState {
  String errorMessage;
  GetLaunchesFailuer({required this.errorMessage});
}
