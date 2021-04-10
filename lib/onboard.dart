import 'package:discover_kenya/login.dart';
import 'package:flutter/material.dart';
import 'package:discover_kenya/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buttonSize = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  image: AssetImage("assets/background1.jpeg"),
                  fit: BoxFit.fitHeight),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Discover Kenya",
                style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    letterSpacing: .4),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 220.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Beautiful photos of Kenya",
                style: GoogleFonts.raleway(color: Colors.white, fontSize: 22.0),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/logo.png",
              fit: BoxFit.fill,
              width: 100.0,
              height: 100.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 550.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Material(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.lightBlue[600],
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmailSignUp()),
                    );
                  },
                  // padding: EdgeInsets.fromLTRB(3.0, 15.0, 3.0, 15.0),
                  minWidth: buttonSize.size.width / 2.3,
                  child: Text(
                    "Register",
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 100.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmailLogIn()),
                  );
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
