import 'package:flutter/material.dart';

int _selectedIndex = 0;
void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

void setState(Null Function() param0) {}

class Liste extends StatelessWidget {
  const Liste({super.key});

  get onChanged => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.back_hand),
            label: 'Retour',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel),
            label: 'Déconnexion',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff708907),
        onTap: _onItemTapped,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.5, 1.0],
          colors: [
            Color(0XFF035B6F),
            Colors.white,
            Color(0XFF708908),
          ],
        )),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(height: 40),
          ListView(
            children: const <Widget>[
              ListTile(
                leading: Icon(Icons.map),
                title: Text('Map'),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Album'),
              ),
            ],
          ),
          const SizedBox(height: 50),
          MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: const Color(0xff708907),
              minWidth: 2,
              padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Liste()));
              },
              child: const Text(
                "Calcul besoins",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                ),
              )),
        ]),
      ),
    );
  }
}

class CustomDropdownFormField extends StatefulWidget {
  const CustomDropdownFormField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownFormFieldState createState() =>
      _CustomDropdownFormFieldState();
}

class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  String? _selectedValue;
  final List<String> _options = ['Tarie', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: const Color(0XFF035B6F),
      focusColor: const Color(0x00035b6f),
      value: _selectedValue,
      hint: const Text(
        'Parité',
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 18,
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      decoration: const InputDecoration(
          hoverColor: Colors.white,
          icon: Icon(
            Icons.map,
            color: Colors.white,
          ),
          hintStyle: TextStyle(color: Colors.white),
          fillColor: Color(0x00035b6f),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
      },
      items: _options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
