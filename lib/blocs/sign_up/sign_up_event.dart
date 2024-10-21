import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpButtonActionCall extends SignUpEvent {
  final String signUpEmail;
  final String signUpPassword;

  SignUpButtonActionCall({required this.signUpEmail, required this.signUpPassword});

  @override
  List<Object?> get props => [signUpEmail, signUpPassword];
}
