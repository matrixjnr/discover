import 'package:discover_kenya/discover.dart';
import 'package:discover_kenya/home.dart';
import 'package:discover_kenya/likes.dart';
import 'package:discover_kenya/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';

var user = FirebaseAuth.instance.currentUser;

class Pagenav extends StatefulWidget {
  @override
  _PagenavState createState() => _PagenavState();
}

class _PagenavState extends State<Pagenav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(uid: user.uid),
    Discover(),
    Likes(),
    Profile(uid: user.uid)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                rippleColor: Colors.grey[300],
                hoverColor: Colors.grey[200],
                gap: 4,
                activeColor: Colors.lightBlue[700],
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100],
                textStyle: GoogleFonts.raleway(
                    letterSpacing: .3, color: Colors.lightBlue[700]),
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.fire,
                    text: 'Discover',
                  ),
                  GButton(
                    icon: LineIcons.heart_o,
                    text: 'Saved',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  )
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
// class BottomBar extends StatefulWidget {
//   @override
//   _BottomBarState createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int _currentIndex = 0;
//   final List<Widget> _children = [Profile()];
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       onTap: onTabTapped,
//       elevation: 0,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Colors.lightBlue[700],
//       selectedLabelStyle: GoogleFonts.raleway(
//           fontSize: 15.0, letterSpacing: .3, fontWeight: FontWeight.bold),
//       unselectedLabelStyle: GoogleFonts.raleway(
//           fontSize: 14.0, letterSpacing: .2, color: Colors.black),
//       iconSize: 20.0,
//       currentIndex: _currentIndex,
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.home_outlined,
//           ),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.explore_outlined, color: Colors.black),
//           label: 'Discover',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.favorite_outline, color: Colors.black),
//           label: 'Liked',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.account_circle_outlined,
//             color: Colors.black,
//           ),
//           label: 'Profile',
//         ),
//       ],
//     );
//   }

//   void onTabTapped(int index) {
//     setState(() {

//       _currentIndex = index;
//     });
//   }
// }
