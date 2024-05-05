import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets_model.dart';
import 'package:galaxyxgate/features/rockets/data/repository/rockets_repository.dart';
part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  final RocketsRepository rocketsRepository;

  RocketsCubit({required this.rocketsRepository})
      : super(const RocketsInitial());

  Future<void> getRockets() async {
    emit(const RocketsLoading());
    await rocketsRepository.getAllRockets().then((result) {
      result.fold(
        (failure) => emit(RocketsError(failure.errMessage)),
        (rockets) => emit(RocketsLoaded(rockets)),
      );
    });
  }
}
