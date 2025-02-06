import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Logo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), // Background with logo
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark overlay for better readability (optional)
          Container(
            color: Colors.black.withOpacity(0.0), // Adjust opacity as needed
          ),

          // Buttons positioned at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 80), // Adjust as needed
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login"); // Navigate to login screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 14),
                      backgroundColor: Colors.cyan, // Adjust color as needed
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("Log In", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),

                  SizedBox(height: 10),

                  // Sign Up Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup"); // Navigate to sign-up screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 14),
                      backgroundColor: Colors.white, // Light color for contrast
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("Sign Up", style: TextStyle(fontSize: 18, color: Colors.cyan)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
