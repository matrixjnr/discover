import 'package:discover_kenya/login.dart';
import 'package:discover_kenya/onboard.dart';
import 'package:discover_kenya/pagenav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailSignUp extends StatefulWidget {
  @override
  _EmailSignUpState createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  bool _isHidden2 = true;
  bool _isHidden = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordMatch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final prevButton = TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Onboard()),
        );
      },
      child: Image.asset(
        "assets/back-button.png",
        width: 33.0,
        height: 33.0,
      ),
    );

    final logo = Image.asset(
      "assets/logo.png",
      width: 42.0,
      height: 42.0,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.24), BlendMode.darken),
              image: AssetImage('assets/signup.jpg'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: logo,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: prevButton,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Create an account with us",
                                style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  letterSpacing: .3,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 26.0),
                              ),
                              Text(
                                "Get started for free",
                                style: GoogleFonts.raleway(
                                  color: Colors.grey[600],
                                  fontSize: 17.0,
                                  letterSpacing: .3,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.56,
                                width: MediaQuery.of(context).size.width * 0.74,
                                child: Form(
                                  key: _formKey,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: TextFormField(
                                            controller: nameController,
                                            style: GoogleFonts.raleway(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              letterSpacing: .3,
                                            ),
                                            textCapitalization:
                                                TextCapitalization.words,
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              labelText: "Name",
                                              labelStyle: GoogleFonts.raleway(
                                                color: Colors.black,
                                                letterSpacing: .2,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Please enter your name";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: TextFormField(
                                            style: GoogleFonts.raleway(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              letterSpacing: .3,
                                            ),
                                            controller: emailController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              labelText: "Email Address",
                                              labelStyle: GoogleFonts.raleway(
                                                color: Colors.black,
                                                letterSpacing: .2,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Mandatory Field, Enter an Email Address';
                                              } else if (!value.contains('@')) {
                                                return 'Your email lacks an @ sign. Please include a valid email address into this field';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: TextFormField(
                                            style: GoogleFonts.raleway(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              letterSpacing: .3,
                                            ),
                                            controller: passwordController,
                                            obscureText: _isHidden,
                                            decoration: InputDecoration(
                                              suffix: InkWell(
                                                onTap: _togglePasswordView,
                                                child: Icon(Icons.visibility),
                                              ),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              labelText: "Password",
                                              labelStyle: GoogleFonts.raleway(
                                                color: Colors.black,
                                                letterSpacing: .2,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Mandatory Field, Enter Password';
                                              } else if (value.length < 8) {
                                                return 'Password must be at least 8 characters!';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: TextFormField(
                                            style: GoogleFonts.raleway(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              letterSpacing: .3,
                                            ),
                                            controller: passwordMatch,
                                            obscureText: _isHidden2,
                                            decoration: InputDecoration(
                                              suffix: InkWell(
                                                onTap: _togglePasswordView2,
                                                child: Icon(Icons.visibility),
                                              ),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              labelText: "Confirm Password",
                                              labelStyle: GoogleFonts.raleway(
                                                color: Colors.black,
                                                letterSpacing: .2,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Please confirm your password';
                                              } else if (value !=
                                                  passwordController.text) {
                                                return 'Passwords do not match, try again';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 30),
                                          child: isLoading
                                              ? CircularProgressIndicator()
                                              : MaterialButton(
                                                  color: Colors.lightBlue[600],
                                                  splashColor: Colors.white,
                                                  onPressed: () {
                                                    if (_formKey.currentState
                                                        .validate()) {
                                                      setState(() {
                                                        isLoading = true;
                                                      });
                                                      registerToFb();
                                                    }
                                                  },
                                                  child: Text(
                                                    "Register",
                                                    style: GoogleFonts.raleway(
                                                        color: Colors.white,
                                                        fontSize: 17.0,
                                                        letterSpacing: .4),
                                                  ),
                                                ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 20),
                                          child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EmailLogIn()),
                                                  );
                                                },
                                                child: Text(
                                                    "Already have an account?",
                                                    style: GoogleFonts.raleway(
                                                      fontSize: 15.0,
                                                      letterSpacing: .3,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _togglePasswordView2() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }

  void registerToFb() {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      dbRef.child(result.user.uid).set({
        "email": emailController.text,
        "name": nameController.text
      }).then((res) {
        isLoading = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Pagenav()),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
