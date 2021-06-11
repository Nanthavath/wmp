import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wmp/providers/local_provider.dart';

import 'screens/authen/sign_in.dart';
import 'package:wmp/generated/l10n.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocaleProvider>(
      create: (context) => LocaleProvider(),
      child: Builder(
        builder: (context) =>  MaterialApp(
          theme: ThemeData(
            fontFamily: "NotoSandsLao"
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Provider.of<LocaleProvider>(context,listen: true).currentLocale,
          supportedLocales: S.delegate.supportedLocales,
          home: SignIn(),
        ),
      ),
    );
  }
}
