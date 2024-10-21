import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpInit extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpError extends SignUpState {
  final String signUpError;

  SignUpError({required this.signUpError});

  @override
  List<Object?> get props => [signUpError];
}

class SignUpSucces extends SignUpState {
  final UserCredential userCredential;

  SignUpSucces({required this.userCredential});

  @override
  List<Object?> get props => [userCredential];
}
