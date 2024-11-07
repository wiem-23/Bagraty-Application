/* import 'package:bagraty_project/Bagraty/AjoutVache.dart';
import 'package:bagraty_project/Bagraty/calculBesoinsConcentes.dart';
import 'package:bagraty_project/Bagraty/calculBesoinsFourrages.dart';
import 'package:bagraty_project/Bagraty/first_page.dart';
import 'package:bagraty_project/Bagraty/menu.dart';
import 'package:bagraty_project/bagraty/Apports.dart';
import 'package:flutter/material.dart';

class Bottomnavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

// === The main part starts here!

class MainPage extends StatefulWidget {
  @override
  DashboardScreen createState() {
    return DashboardScreen();
  }
}

class DashboardScreen extends State<MainPage> {
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return CalculBesoinsConcentres(); // MainPage() // why? it's
// returning the same widget again recursively...
      case 1:
        return Ajoutvache();
        ; // MainPage() // why? it's
// returning the same widget again recursively...
      case 2:
        return CalculBesoinsFourrages(); // SecondPage()
      case 3:
        return Apports(); // ThirdPage()
      // ThirdPage()

      default:
        return Ajoutvache(); // HomePage() same mistake here
    }
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
              backgroundColor: Colors.blue)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
            print("setstate");
          });
          _currentIndex = index;
        },
      ),
    );
  }
}
 */