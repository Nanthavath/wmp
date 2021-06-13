part of 'locale_lang_bloc.dart';

@immutable
abstract class LocaleLangEvent {}

class LocaleLoadEvent extends LocaleLangEvent {
  @override
  String toString() =>"LocaleLoadingEvent";
}


class LocaleChangeEvent extends LocaleLangEvent {
  final String languageCode;
  LocaleChangeEvent(this.languageCode);
  @override
  String toString() => " Event: Change locale language=$languageCode";
}

class LocaleSaveEvent extends LocaleLangEvent{
  @override
  String toString() =>"Save Locale";
}
