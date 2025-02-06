import 'package:diacare360/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiaCare360',
      debugShowCheckedModeBanner: false, // Removes debug banner
      theme: ThemeData(
        primarySwatch: Colors.cyan, // Adjusted to match your design
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AuthWrapper(), // Check if user is logged in or not
      routes: {
        '/welcome': (context) => WelcomeScreen(), // Welcome Screen
        '/login': (context) => LoginScreen(), // Login Screen
        '/signup': (context) => SignUpScreen(), // Sign-up Screen
        '/onboarding': (context) => OnboardingScreen(), // Home Screen after login
      },
    );
  }
}

/// **AuthWrapper** - Redirects users based on authentication status
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen(); // Show splash while checking auth state
        } else if (snapshot.hasData) {
          return OnboardingScreen(); // User is logged in
        } else {
          return WelcomeScreen(); // User is not logged in
        }
      },
    );
  }
}
