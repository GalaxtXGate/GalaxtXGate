part of 'localization_cubit.dart';

sealed class LocalizationState extends Equatable {
  const LocalizationState();

  @override
  List<Object> get props => [];
}

final class ChangeLang extends LocalizationState {
  final Locale locale;
  const ChangeLang(
    this.locale,
  );
}
