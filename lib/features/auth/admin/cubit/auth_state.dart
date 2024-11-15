part of 'auth_cubit.dart';

sealed class AuthcubitState {
  const AuthcubitState();

  List<Object> get props => [];
}

final class AuthcubitInitial extends AuthcubitState {}

final class AuthCubitSuccess extends AuthcubitState {}

final class AuthCubitLoading extends AuthcubitState {}

final class AuthCubitFailure extends AuthcubitState {
  final String failureMsg;
  const AuthCubitFailure({required this.failureMsg});
}
