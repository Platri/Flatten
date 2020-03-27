import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localizations.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';
import 'ui/landing_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Auth>(
        create: (context) => Auth(),
          child:  MaterialApp(
        onGenerateTitle: (context) {
          return AppLocalizations.of(context).title;
        },
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          const Locale("en"),
          const Locale("de"),
        ],
        theme: ThemeData(
            primaryColorDark: Color(0xff033076),
            accentColor: Color(0xFF88C7BC),
            primaryColor: Colors.white,
            splashColor: Color(0xFF88C7BC),
            primaryTextTheme: TextTheme(
                headline: TextStyle(
                    color: Color(0xff033076), fontWeight: FontWeight.bold)),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              buttonColor: Color(0xff033076),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0)),
            )),
        home: LandingPage(),//this class decides which screen to show, SignInPage() or HomePage()
      ),
    );
  }
}
