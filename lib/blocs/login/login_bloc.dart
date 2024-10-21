import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samif/blocs/login/login_event.dart';
import 'package:samif/blocs/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  LoginBloc() : super(LoginInit()) {
    on<LoginButtonActionCall>((event, emit) async {
      emit(LoginLoading());
      try {
        final UserCredential userCredential =
            await firebaseAuth.signInWithEmailAndPassword(
                email: event.loginEmail, password: event.loginPassword);

        emit(LoginSuccess(userCredential: userCredential));
      } on FirebaseAuthException catch (e) {
        emit(LoginError(loginError: e.message ?? "Unknown error occurred."));
      } catch (e) {
        emit(LoginError(loginError: "An Unknown error Occured"));
      }
    });
  }
}
