import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fruit_hub_admin/core/helper_function/validation_function.dart';
import 'package:fruit_hub_admin/features/auth/presintation/views/widgets/custom_button.dart';
import 'package:fruit_hub_admin/features/auth/presintation/views/widgets/text_field_custom.dart';

import '../../../../home/presintation/views/home_view.dart';
import '../../../admin/cubit/auth_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});
  static const routeName = 'LoginPage';
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureTextV = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                Hero(
                  tag: 'appLogo',
                  child: Image.asset(
                    'assets/images/app_logo.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                CustomTextField(
                  onChangedF: (value) {
                    formKey.currentState!.validate();
                  },
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  controller: emailController,
                  key: const ValueKey('email'),
                  textInputAction: TextInputAction.next,
                  suffixIcon: const Icon(Icons.email),
                  validatorF: (value) {
                    return validateEmail(value);
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  onChangedF: (value) {
                    formKey.currentState!.validate();
                  },
                  hintText: 'password',
                  controller: passwordController,
                  key: const ValueKey('password'),
                  textInputAction: TextInputAction.done,
                  hideText: obscureTextV,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureTextV = !obscureTextV;
                      });
                    },
                    icon: obscureTextV
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  validatorF: (value) {
                    return validatepassword(value);
                  },
                ),
                const SizedBox(height: 30),
                BlocConsumer<Authcubit, AuthcubitState>(
                  listener: (context, state) {
                    if (state is AuthCubitFailure) {
                      Fluttertoast.showToast(
                        msg: state.failureMsg,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else if (state is AuthCubitSuccess) {
                      Fluttertoast.showToast(
                        msg: 'Login Successful',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      Navigator.pushReplacementNamed(
                          context, HomeView.routeName);
                    }
                  },
                  builder: (context, state) {
                    return CustomButtonForAuth(
                      child: state is AuthCubitLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                      onPressedF: () async {
                        if (formKey.currentState!.validate()) {
                          await BlocProvider.of<Authcubit>(context).loginUserF(
                              lEmail: emailController.text,
                              lPassword: passwordController.text);
                        }

                        User user = FirebaseAuth.instance.currentUser!;

                        log(user.toString());
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
