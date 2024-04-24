import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/rendered_page.dart';
// import 'package:ccce_application/src/screens/home_page.dart';

// import 'main.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  static const proBonoRed =
      Color.fromARGB(255, 189, 42, 42); //find actual color

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  // child: Image.asset('Image Link (put in assets folder)'),
                ),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text('Welcome to Pro Bono, please sign in!')
                    : const Text('Welcome to Pro Bono, please sign up!'),
              );
            },
          );
        }
        print('HIT');
        return const RenderedPage();
      },
    );
  }
}
