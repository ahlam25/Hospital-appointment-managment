import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iappoint/firebase_options.dart';
import 'package:iappoint/res/thanku_page.dart';
import 'package:iappoint/screens/confirmation_page.dart';
import 'package:iappoint/screens/home.dart';
import 'package:iappoint/screens/login.dart';
import 'package:iappoint/screens/signup.dart';
import 'package:iappoint/screens/user_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'i-Appoint',
      initialRoute: "login",
      routes: {
        'login': (context) => const LoginPage(),
        'signup': (context) => const SignUp(),
        'home': (context) => const HomePage(),
        'confirm': (context) => const Confirmation(),
        'user_details': (context) => const UserDetails(),
        'thank_you': (context) => const ThankYouPage(title: "Thank You"),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
