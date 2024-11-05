/* // ignore_for_file: prefer_final_fields

import 'package:bagraty_project/Bagraty/AjoutVache.dart';
import 'package:bagraty_project/Bagraty/approvisionnement.dart';
import 'package:bagraty_project/Bagraty/calculBesoinsConcentes.dart';
import 'package:bagraty_project/Bagraty/first_page.dart';
import 'package:bagraty_project/Bagraty/menu.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  // Liste des pages qui seront affichées en fonction de l'index sélectionné

  // Fonction pour changer de page en fonction de l'index sélectionné
  void _onItemTapped(int index) {
    _selectedIndex = index;

    setState() {
      _selectedIndex = index;
      print(_selectedIndex);
    }

    print(_selectedIndex);
  }

  List<Widget> _widgetOptions = <Widget>[
    const Text('data0'),
    const Text('data1'),
    const Text('data2'),
    const Text('data3'),
  ];

  @override
  Widget build(BuildContext context) {
    print('aaa $_selectedIndex');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar Example'),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex], // Affiche la page correspondante
      ),
      // La barre de navigation inférieure
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        // Fonction appelée lors du changement de page
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bagraty_project/Bagraty/AjoutVache.dart';
import 'menu.dart';

class BottomNavExample extends StatefulWidget {
  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _selectedIndex = 0;

  // Liste des pages qui seront affichées en fonction de l'index sélectionné
  static const List<Widget> _widgetOptions = <Widget>[
    const Ajoutvache(),
    Text('Page 2 - Recherche',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Page 3 - Notifications',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Page 4 - Profil',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  // Fonction appelée lors du changement de page (sélection de l'item)
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Met à jour l'index sélectionné
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Example'),
      ),
      body: Center(
        child: _widgetOptions[
            _selectedIndex], // Affiche la page correspondant à l'index sélectionné
      ),
      // La barre de navigation inférieure
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _selectedIndex, // Indique l'index de l'élément sélectionné
        onTap: _onItemTapped, // Fonction appelée lors du changement de page
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
