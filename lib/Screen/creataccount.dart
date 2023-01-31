import 'package:flutter/material.dart';
import 'package:note_taking_ui/Screen/Login.dart';
import 'package:note_taking_ui/controller/auth_provider.dart';
import 'package:note_taking_ui/main.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: SizedBox(
            height: (MediaQuery.of(context).size.height),
            width: (MediaQuery.of(context).size.width),
            child: SingleChildScrollView(
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
                    "Create a free account",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff403b36),
                    ),
                  ),
                  const Text(
                    "Join Notely for free. Create and share\nunlimited notes with your friends.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff595550),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const TextWidget(
                    text: "Full Name",
                  ),
                  const TextFieldBox(
                    text: "Enter Your Full Name",
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const TextWidget(text: "Email Address"),
                  TextFieldBox(
                    controller: emailController,
                    text: "Enter Your Email Address",
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const TextWidget(text: "Password"),
                  TextFieldBox(
                    controller: passwordController,
                    text: "Enter Your New Password",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBox(
                      text: "Create Account",
                      ontap: () async {
                        await Provider.of<AuthProvider>(context, listen: false)
                            .signUp(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          context,
                        )
                            .then((value) {
                          if (value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogInPage()));
                          }
                        });
            
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const LogInPage()));
                      }),
                  const NoteButton(text: "Already have an account?"),
                ],
              ),
            ),
          )),
          Provider.of<AuthProvider>(context).isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class TextFieldBox extends StatelessWidget {
  const TextFieldBox({
    required this.text,
    this.controller,
    Key? key,
  }) : super(key: key);
  final TextEditingController? controller;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xff595550),
          ),
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xff403b36),
          ),
        ),
      ),
    );
  }
}
