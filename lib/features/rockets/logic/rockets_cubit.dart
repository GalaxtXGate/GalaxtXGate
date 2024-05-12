import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets_model.dart';
import 'package:galaxyxgate/features/rockets/data/services/rockets_services.dart';
part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  RocketsCubit({required RocketsService rocketsService})
      : super(const RocketsInitial()) {
    _rocketsService = rocketsService;
  }
  late RocketsService _rocketsService;
  Future<void> getRockets() async {
    emit(const RocketsLoading());
    Either<ServerFailure, List<RocketsModel>> result =
        await _rocketsService.getAllRockets();

    result.fold(
      (failure) => emit(RocketsError(failure.errMessage)),
      (rockets) => emit(RocketsLoaded(rockets)),
    );
  }
}
