import 'package:flutter/material.dart';

import 'package:note_taking_ui/Screen/creataccount.dart';
import 'package:note_taking_ui/main.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: (MediaQuery.of(context).size.height),
          width: (MediaQuery.of(context).size.width),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const AppName(),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Login Now !",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff403b36),
                ),
              ),
              const Text(
                "Login Notely to track your notes.Create and\n share unlimited notes with your friends.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff595550),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const TextWidget(text: "Email Address"),
              const TextFieldBox(text: "Enter Your Email"),
              const SizedBox(
                height: 40,
              ),
              const TextWidget(text: "Password"),
              const TextFieldBox(text: "Enter Your Password"),
              const SizedBox(
                height: 70,
              ),
              GetBox(
                  text: "LogIn",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
