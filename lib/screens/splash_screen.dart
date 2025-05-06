// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:doctor_finder_flutter/providers/auth_provider.dart';
import 'package:doctor_finder_flutter/services/firebase_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    try {
      // Wait a bit more for Firebase to initialize
      await Future.delayed(const Duration(seconds: 2));

      // Check if Firebase is initialized
      if (!FirebaseService.isInitialized) {
        print('Firebase not initialized yet, continuing with limited features');
        if (mounted) {
          context.go('/home');  // Navigate to home as guest
        }
        return;
      }

      if (mounted) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);

        // Give auth provider a moment to check status
        await Future.delayed(const Duration(milliseconds: 500));

        if (authProvider.isLoggedIn) {
          context.go('/home');
        } else {
          context.go('/auth');
        }
      }
    } catch (e) {
      print('Error in splash navigation: $e');
      if (mounted) {
        // Navigate to home on error
        context.go('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.medical_services,
                  size: 150,
                  color: Colors.white,
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Doctor Finder',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Find Doctors Near You',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 100),
            const Text(
              'Developed by: Bame Junior Noko',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const Text(
              'NB22000934',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            if (!FirebaseService.isInitialized)
              const Text(
                'Running in offline mode',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
          ],
        ),
      ),
    );
  }
}