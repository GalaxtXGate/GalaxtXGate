import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/features/crew/data/models/crew_model.dart';
import 'package:galaxyxgate/features/crew/data/services/crews_services.dart';
part 'crews_state.dart';

class CrewsCubit extends Cubit<CrewsState> {
  CrewsCubit({required CrewService crewService}) : super(const CrewsInitial()) {
    _crewService = crewService;
  }
  late CrewService _crewService;

  Future<void> getCrews() async {
    emit(const CrewsLoading());
    await _crewService.getAllCrews().then((result) {
      result.fold(
        (failure) => emit(CrewsError(failure.errMessage)),
        (crews) => emit(CrewsLoaded(crews)),
      );
    });
  }
}
