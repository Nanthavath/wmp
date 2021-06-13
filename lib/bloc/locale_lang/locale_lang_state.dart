part of 'locale_lang_bloc.dart';

@immutable
abstract class LocaleLangState {}

class InitialLocaleLangState extends LocaleLangState {
  @override
  String toString() => "InitialLocaleLangState";
}

class LocaleLoadingState extends LocaleLangState {
  @override
  String toString() => "LocaleLoadingState";
}

class LocaleLoadedState extends LocaleLangState {
  @override
  String toString() => "LocaleLoadedState:";
}
