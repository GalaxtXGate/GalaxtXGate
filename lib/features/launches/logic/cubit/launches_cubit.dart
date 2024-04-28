import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/features/launches/data/models/launches_model.dart';
import 'package:galaxyxgate/features/launches/data/services/launches_services.dart';

part 'launches_state.dart';

class LaunchesCubit extends Cubit<LaunchesState> {
  LaunchesCubit({required LaunchesServices launchesServices})
      : super(LaunchesInitial()) {
    _launchesServices = launchesServices;
  }
  late LaunchesServices _launchesServices;

  Future<void> getLaunches() async {
    emit(GetLaunchesLoading());
    Either<ServerFailure, List<Launche>> result =
        await _launchesServices.getLaunches();
    result.fold(
      (error) => emit(
        GetLaunchesFailuer(
          errorMessage: error.errMessage,
        ),
      ),
      (launches) => emit(
        GetLaunchesSuccess(launchesModel: launches),
      ),
    );
  }
}
