import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub_admin/core/style/app_colors.dart';
 import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helper_function/on_generate_route.dart';
import 'features/add_product/admin/add_new_product_cubit/add_new_product_cubit.dart';
import 'features/auth/admin/cubit/auth_cubit.dart';
 import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  User? user = FirebaseAuth.instance.currentUser;

  log(user.toString());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Authcubit()),
        BlocProvider(create: (context) => AddNewProductCubit()),
        // BlocProvider(create: (context) => ViewAllProductsCubit()),
      ],
      child: const FruitHubAdmin(),
    ),
  );
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
        scaffoldBackgroundColor: Colors.white,
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                iconColor: WidgetStatePropertyAll(StyleColors.primaryColor))),
        textTheme: GoogleFonts.cairoTextTheme(),
        fontFamily: GoogleFonts.cairo().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: GoogleFonts.cairo().fontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: StyleColors.primaryColor),
        ),
        cardTheme: const CardTheme(color: Colors.white, elevation: 2.0),
        useMaterial3: true,
      ),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
