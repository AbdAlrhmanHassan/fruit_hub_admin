import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class Authcubit extends Cubit<AuthcubitState> {
  Authcubit() : super(AuthcubitInitial());

  User? user1 = FirebaseAuth.instance.currentUser;

  Future<void> loginUserF(
      {required String lEmail, required String lPassword}) async {
    try {
      emit(AuthCubitLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: lEmail.trim(), password: lPassword.trim());
      if (user1 != null) {
        log(user1!.email.toString());
        log(user1!.email.toString());
      }

      emit(AuthCubitSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const AuthCubitFailure(failureMsg: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(const AuthCubitFailure(failureMsg: 'wrong-password'));
      } else {
        emit(AuthCubitFailure(failureMsg: e.toString()));
        log(e.toString());
      }
    } on FirebaseException catch (e) {
      // Handle other types of FirebaseExceptions
      emit(AuthCubitFailure(failureMsg: "FirebaseException occurred: $e"));
    } catch (e) {
      emit(AuthCubitFailure(failureMsg: e.toString()));
    }
  }
}
