import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samif/widget/form_field.dart';
import 'package:samif/widget/password_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Container(child: registerForm()),
    );
  }

  Widget registerForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Register",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                MyFormField(
                  hint: "Username",
                  textEditingController: usernameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please type Your Email Address";
                    }
                    return null;
                  },
                ),
                MyFormField(
                  hint: "Email",
                  textEditingController: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please type Your Email Address";
                    }
                    return null;
                  },
                ),
                PasswordFormField(
                  hintText: "Password",
                  textEditingController: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please type your Password";
                    }
                    return null;
                  },
                ),
                PasswordFormField(
                  hintText: "ConfirmPassword",
                  textEditingController: confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please type your Confirm Password";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {}
                      },
                      child: Text("Register"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
