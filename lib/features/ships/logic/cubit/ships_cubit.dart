import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/features/ships/data/models/ships.dart';
import 'package:galaxyxgate/features/ships/data/repository/ships_repository.dart';

part 'ships_state.dart';

class ShipsCubit extends Cubit<ShipsState> {
  final ShipsRepository shipsRepository;

  ShipsCubit({required this.shipsRepository}) : super(const ShipsInitial());

  Future<void> getShips() async {
    emit(const ShipsLoading());
    await shipsRepository.getAllShips().then((result) {
      result.fold(
        (failure) => emit(ShipsError(failure.errMessage)),
        (ships) => emit(ShipsLoaded(ships)),
      );
    });
  }
}
