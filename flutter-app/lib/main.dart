import 'package:flatten/bloc/hs_info_block.dart';
import 'package:flatten/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localizations.dart';
import 'package:flatten/bloc/auth_bloc.dart';
import 'ui/landing_page.dart';
import 'bloc/bloc_provider.dart';
import 'ui/handshake/handshake_info_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<Auth>(
        bloc: Auth(),
          child:  BlocProvider<HS_Info_Bloc>(
            bloc: HS_Info_Bloc(),
                      child: MaterialApp(
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
                  headline6: TextStyle(
                      color: Color(0xff033076), fontWeight: FontWeight.bold)),
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                buttonColor: Color(0xff033076),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0)),
              )),
        home: LandingPage(),//this class decides which screen to show, SignInPage() or HomePage()
      ),
          ),
    );
  }
}
