import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wmp/bloc/locale_lang/locale_lang_bloc.dart';
import 'package:bloc/bloc.dart';

import 'bloc/flow_bloc_delegate.dart';
import 'screens/authen/sign_in.dart';
import 'package:wmp/generated/l10n.dart';

void main() {
  Bloc.observer = FlowBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleLangBloc(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: ThemeData(fontFamily: "NotoSandsLao"),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: Locale(BlocProvider.of<LocaleLangBloc>(context).languageCode.toString()),
            supportedLocales: S.delegate.supportedLocales,
            home: SignIn(),
          );
        },
      ),
    );
  }
}
