import 'package:bagraty_project/ajoutfourragepopup.dart';
import 'package:flutter/material.dart';

int _selectedIndex = 0;
void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

void setState(Null Function() param0) {}

class CalculBesoins extends StatelessWidget {
  const CalculBesoins({super.key});

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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
        child: Column(
          children: [
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.man_2_outlined,
                  color: Colors.white,
                ),
                labelText: 'Nom Exploitant',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.man_2_outlined,
                  color: Colors.white,
                ),
                labelText: 'ID vache',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.man_2_outlined,
                  color: Colors.white,
                ),
                labelText: 'ID père',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.man_2_outlined,
                  color: Colors.white,
                ),
                labelText: 'ID mère',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.man_2_outlined,
                  color: Colors.white,
                ),
                labelText: 'Poids vache',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.man_2_outlined,
                  color: Colors.white,
                ),
                labelText: 'Age au 1er velage',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            CustomDropdownFormField(),
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.man_2_outlined,
                  color: Colors.white,
                ),
                labelText: 'Production lait',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.line_weight_sharp,
                  color: Colors.white,
                ),
                labelText: 'Mois gestation',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.man_2_outlined,
                  color: Colors.white,
                ),
                labelText: 'Température',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.numbers,
                  color: Colors.white,
                ),
                labelText: 'Humidité',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            const Divider(
              height: 40.0,
              color: Color.fromRGBO(0, 0, 0, 0),
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: const Color(0xff708907),
                minWidth: 2,
                padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AjoutFourragePopup()));
                  print("cliqued");
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
          ],
        ),
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
