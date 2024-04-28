import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/features/crew/data/models/crew_model.dart';
import 'package:galaxyxgate/features/crew/data/repository/crews_repository.dart';
part 'crews_state.dart';

class CrewsCubit extends Cubit<CrewsState> {
  final CrewRepository crewRepository;

  CrewsCubit({required this.crewRepository}) : super(const CrewsInitial());

  Future<void> getCrews() async {
    emit(const CrewsLoading());
    await crewRepository.getAllCrew().then((result) {
      result.fold(
        (failure) => emit(CrewsError(failure.errMessage)),
        (crews) => emit(CrewsLoaded(crews)),
      );
    });
  }
}
