import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samif/blocs/sign_up/sign_up_event.dart';
import 'package:samif/blocs/sign_up/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  SignUpBloc() : super(SignUpInit()) {
    on<SignUpButtonActionCall>(
      (event, emit) async {
        emit(SignUpLoading());

        try {
          final UserCredential userCredential =
              await auth.createUserWithEmailAndPassword(
            email: event.signUpEmail,
            password: event.signUpPassword,
          );

          emit(SignUpSucces(userCredential: userCredential));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'email-already-in-use') {
            emit(SignUpError(signUpError: "Email already in use."));
          } else if (e.code == 'weak-password') {
            emit(SignUpError(signUpError: "The password is too weak."));
          } else {
            print(e.message);
            emit(SignUpError(
                signUpError: e.message ?? "Unknown error occurred."));
          }
        } catch (e) {
          emit(SignUpError(signUpError: "An unknown error occurred."));
        }
      },
    );
  }
}
