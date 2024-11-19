import 'package:bagraty_app/Bagraty/Inscription.dart';
import 'package:bagraty_app/BagratyArabic/InscriptionArabic.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage> {
  String? _selectedOption;
  bool arabic = false;
  final List<String> _langue = ['Français', 'العربية'];

  void initState() {
    super.initState();
    arabic = false;
  }

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/vache_firstpage.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
          child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        front: Card(
          elevation: 20.0,
          color: const Color.fromRGBO(255, 255, 255, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  height: 10.0,
                  color: Color.fromRGBO(255, 255, 255, 0),
                ),
                // ignore: unnecessary_const
                Image.asset(
                  'assets/images/optimiseur.jpg',
                  height: 175,
                  width: 150,
                ),
                const Divider(
                  height: 10.0,
                  color: Color.fromRGBO(0, 0, 0, 0),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // Couleur de la bordure
                    )),
                    isExpanded: true,
                    elevation: 20,
                    hint: const Text('Langue',
                        style: TextStyle(
                            color: Color(0XFF035B6F),
                            fontWeight: FontWeight.w200)),
                    value: _selectedOption,
                    onChanged: (String? newValue) {
                      print(arabic);
                      _selectedOption = newValue;
                      if (newValue == 'العربية') {
                        arabic = true;
                        setState(() {
                          arabic = true;
                        });
                      } else if (newValue == 'Français') {
                        arabic = false;
                        setState(() {
                          arabic = false;
                        });
                      }
                      print(arabic);
                    },
                    items:
                        _langue.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Color(0XFF035B6F)),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const Divider(
                  height: 10.0,
                  color: Color.fromRGBO(74, 14, 14, 0),
                )
              ],
            ),
          ),
        ),
        back: Card(
          elevation: 30.0,
          color: const Color.fromRGBO(255, 255, 255, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  height: 30.0,
                  color: Color.fromRGBO(0, 0, 0, 0),
                ),
                // ignore: unnecessary_const
                Image.asset(
                  'assets/images/logo_bagraty.png',
                  height: 60,
                  width: 222,
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
                    padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      if (arabic == true) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const InscriptionExpAR()));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const InscriptionExp()));
                      }
                    },
                    child: arabic
                        ? const Text(
                            "دخول",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : Text(
                            "Commencer",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                const Divider(
                  height: 40.0,
                  color: Color.fromRGBO(0, 0, 0, 0),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
