import 'package:discover_kenya/pagenav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:discover_kenya/onboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Discover Kenya',
      home: DKSplashScreen(),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Onboard(),
    );
  }
}

class DKSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User result = FirebaseAuth.instance.currentUser;
    return new SplashScreen(
      navigateAfterSeconds: result != null ? Pagenav() : Onboard(),
      seconds: 3,
      backgroundColor: Colors.blue[700],
      title: Text(
        "Discover Kenya",
        style: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
            wordSpacing: .3,
            color: Colors.white),
      ),
      image: Image.asset(
        "assets/logo.png",
        fit: BoxFit.contain,
      ),
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }
}
