import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{

@override
  List<Object?> get props => [];

}

class LoginButtonActionCall extends LoginEvent{
  final String loginEmail;
  final String loginPassword;

  LoginButtonActionCall({required this.loginEmail, required this.loginPassword});
  
  @override
  List<Object?> get props => [loginEmail,loginPassword];

  

}