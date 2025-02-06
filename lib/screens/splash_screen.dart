import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the Welcome screen after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splashscreen.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Loader Positioned at the Bottom
          Column(
            mainAxisAlignment: MainAxisAlignment.end, // Puts loader at bottom
            children: const [
              Padding(
                padding: EdgeInsets.only(bottom: 50), // Adjust distance from bottom
                child: SpinKitThreeBounce(
                  color: Colors.white, // Adjust the color as needed
                  size: 50.0, // Adjust the size as needed
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
