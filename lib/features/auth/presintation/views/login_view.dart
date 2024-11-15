import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'widgets/login_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static String routName = "LogInView";
  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<AuthcubitCubit, AuthcubitState>(
    //   builder: (context, state) {
    return Scaffold(
        backgroundColor:
            ThemeData.dark(useMaterial3: true).scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor:
              ThemeData.dark(useMaterial3: true).scaffoldBackgroundColor,
          centerTitle: true,
          title: Shimmer.fromColors(
            // period: const Duration(seconds: 0),
            baseColor: const Color.fromARGB(255, 220, 220, 220),
            highlightColor: Colors.blue[200]!,
            child: const Text(
              "Abu Hashem Fashion",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: const LoginViewBody());
    // },
    // );
  }
}
