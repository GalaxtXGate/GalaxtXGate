import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/features/profile/logic/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileCubit() : super(InitialProfileState());

  bool isProfileEdit = false;

  void swapBetweenViewAndEditProfileData(bool value) {
    isProfileEdit  = value;
    emit(SwapBetweenViewAndEditProfileDataState());
  }
}