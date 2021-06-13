import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_lang_event.dart';

part 'locale_lang_state.dart';

const String PRE_LOCALE = "languageCode";

class LocaleLangBloc extends Bloc<LocaleLangEvent, LocaleLangState> {
  LocaleLangBloc({this.languageCode}) : super(InitialLocaleLangState());
  String? languageCode;

  @override
  Stream<LocaleLangState> mapEventToState(LocaleLangEvent event) async* {
    if (event is LocaleLoadEvent) {
      yield* _mapLocalePrefToState();
    }
    if (event is LocaleChangeEvent) {
      yield* mapChangeEventToState(event.languageCode);
    }
  }

  Stream<LocaleLangState> _mapLocalePrefToState() async* {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    languageCode = preferences.getString(PRE_LOCALE) ?? "en";
    yield LocaleLoadedState();
  }

  Stream<LocaleLangState> mapChangeEventToState(String value) async* {
    print("Language=$value");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(PRE_LOCALE, value);
    languageCode = preferences.getString(PRE_LOCALE) ?? "en";
    yield LocaleLoadedState();
  }
}
