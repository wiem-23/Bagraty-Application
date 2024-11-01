import 'package:bagraty_project/bagraty/inscription.dart';
import 'package:bagraty_project/Bagraty/menu.dart';

import 'package:flutter/material.dart';

import 'calculBesoinsConcentes.dart';
import 'calculBesoinsFourrages.dart';

class Basicpage extends StatefulWidget {
  const Basicpage({super.key});
  void initState() {
    error = false;

    success = false;
  }

  @override
  BasicpageState createState() {
    // ignore: no_logic_in_create_state
    return BasicpageState();
  }
}

class BasicpageState extends State<Basicpage> {
  final TextEditingController tel = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController nom_exploitant = TextEditingController();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Menu(),
    CalculBesoinsConcentres(),
    CalculBesoinsFourrages(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text("data")),
            ListTile(
              title: const Text('Menu'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Menu()));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Concentrés'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Schfourrageool'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const Center(child: CalculBesoinsFourrages()),
    );
  }
}
