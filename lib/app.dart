import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mind_app/di/dependency_injector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/utils/dismiss_keyboard.dart';
import 'package:mind_app/utils/theme_helper.dart';

class App extends StatelessWidget {
  final _router = AppRouter();

  App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return DependencyInjector(
        child: DismissKeyboard(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: ThemeHelper.backgroundColorWhite,
          fontFamily: 'Poppins',
          useMaterial3: true,
          primaryColor: Color.fromARGB(255, 48, 47, 47),
        ),
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('it'), // Italian
        ],
        routeInformationParser: _router.defaultRouteParser(),
        routerDelegate: _router.delegate(),
      ),
    ));
  }
}
