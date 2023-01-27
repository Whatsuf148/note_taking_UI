import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF8EEE2),
        fontFamily: 'Nunito',
      ),
      home: const SplashScreen(),
    );
  }
}

List<Map<String, dynamic>> splashList = [
  {
    "Image": "photo/splashone.jpg",
    "Text": "World’s Safest And \n Largest Digital Notebook",
    "Description":
        "Notely is the world’s safest, largest and \n intelligent digital notebook. Join over \n 10M+ users already using Notely."
  },
  {
    "Image": "photo/splashtwo.jpg",
    "Text": "World’s Safest And \n Largest Digital Notebook",
    "Description":
        "Notely is the world’s safest, largest and \n intelligent digital notebook. Join over \n 10M+ users already using Notely."
  },
  {
    "Image": "photo/splashone.jpg",
    "Text": "World’s Safest And \n Largest Digital Notebook",
    "Description":
        "Notely is the world’s safest, largest and \n intelligent digital notebook. Join over \n 10M+ users already using Notely."
  },
];

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: (MediaQuery.of(context).size.height),
        width: (MediaQuery.of(context).size.width),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "NOTELY",
                style: GoogleFonts.titanOne(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              Expanded(
                child: PageView.builder(
                    itemCount: splashList.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Image.asset(
                            splashList[index]["Image"],
                            height: 170,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "World’s Safest And \n Largest Digital Notebook",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff403B36),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            """ Notely is the world’s safest, largest and \n intelligent digital notebook. Join over \n 10M+ users already using Notely.""",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff595550),
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          const GetBox(
                            text: "Get Started",
                          ),
                          const NoteButton(
                            text: "Allready Have an account?",
                          ),
                        ],
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteButton extends StatelessWidget {
  const NoteButton({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xffD9614C),
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ));
  }
}

class GetBox extends StatelessWidget {
  const GetBox({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 74,
        width: 319,
        decoration: BoxDecoration(
          color: const Color(0xffd9614c),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
