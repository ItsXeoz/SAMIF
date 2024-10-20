import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samif/auth/auth.dart';
import 'package:samif/blocs/login/login_bloc.dart';
import 'package:samif/blocs/sign_up/sign_up_bloc.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => SignUpBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
      ),
    );
  }
}

