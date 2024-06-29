import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fruit_hub_admin/core/style/app_colors.dart';

import 'core/helper_function/on_generate_route.dart';

void main() {
  runApp(const FruitHubAdmin());
}

class FruitHubAdmin extends StatelessWidget {
  const FruitHubAdmin({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(),
        fontFamily: GoogleFonts.cairo().fontFamily,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.cairo().fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 2,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
