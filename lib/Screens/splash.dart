import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chatbot/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color startColor = Colors.black; // Slightly darker shade
    Color endColor = Colors.black;
    return Container(
      // Wrap with Container for gradient background
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [startColor, endColor],
        ),
      ),
      child: AnimatedSplashScreen(
        splash: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Lottie.asset(
                          "assets/Lottie/Animation - 1711659056289.json",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Add spacing between Lottie animation and text
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Colors.black87.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        nextScreen: const LoginPage(),
        backgroundColor: Colors.transparent,
        duration: 5000,
        splashTransition: SplashTransition.fadeTransition,

        // Adding backgroundGradient
      ),
    );
  }
}
