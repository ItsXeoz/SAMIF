import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String loginError;

  LoginError({required this.loginError});

  @override
  // TODO: implement props
  List<Object?> get props => [loginError];
}

class LoginSuccess extends LoginState {
  final UserCredential userCredential;
  LoginSuccess({required this.userCredential});

  @override
  // TODO: implement props
  List<Object?> get props => [userCredential];
}
