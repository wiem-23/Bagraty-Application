import 'package:flutter/material.dart';
import 'dart:math' as math;

class PopupCardConcentre extends StatelessWidget {
  const PopupCardConcentre({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: math.min(450, MediaQuery.sizeOf(context).width - 16.0),
        minHeight: math.min(300, MediaQuery.sizeOf(context).width - 16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Ajouter Concentré',
              style: TextStyle(
                  color: Color(0XFF035B6F),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              selectionColor: Color(0XFF035B6F),
            ),
          ),
          const SizedBox(height: 40.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomDropdownFormField(),
          ),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              cursorColor: Color.fromARGB(255, 49, 46, 46),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color(0XFF035B6F)),

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.numbers,
                  color: Color(0XFF035B6F),
                ),
                labelText: 'Quantité (Kg)',
                labelStyle: TextStyle(
                  color: Color(0XFF035B6F),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFF035B6F)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: const Color(0xff708907),
                  minWidth: 2,
                  padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  onPressed: () {},
                  child: const Text(
                    "Ajouter",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const SizedBox(width: 100.0),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: const Color(0xff708907),
                  minWidth: 2,
                  padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  onPressed: () {
                    Navigator.of(context).pop('ff');
                  },
                  child: const Text(
                    "Annuler",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 30.0),
        ],
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
  final List<String> _options = [
    'Paille de pois',
    'Cannes de Mais',
    'Option 3'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: const Color.fromARGB(255, 186, 235, 247),
      focusColor: const Color.fromARGB(255, 255, 255, 255),
      value: _selectedValue,
      hint: const Text('Aliment',
          style: TextStyle(
              color: Color(0XFF035B6F),
              fontSize: 16,
              fontWeight: FontWeight.bold)),
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 18,
      style: const TextStyle(color: Color(0XFF035B6F)),
      decoration: const InputDecoration(
          focusColor: Color(0XFF035B6F),
          hoverColor: Colors.white,
          icon: Icon(
            Icons.map,
            color: Color(0XFF035B6F),
          ),
          hintStyle: TextStyle(color: Color.fromARGB(255, 52, 53, 53)),
          fillColor: Color.fromARGB(255, 255, 255, 255),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF035B6F)))),
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
