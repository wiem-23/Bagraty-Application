import 'package:bagraty_project/connexion.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
         height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
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
          elevation: 60.0,
          color: const Color.fromRGBO(255, 255, 255, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  height: 30.0,
                  color: Color.fromRGBO(255, 255, 255, 0),
                ),
                // ignore: unnecessary_const
                Image.asset(
                  'assets/images/optimiseur.jpg',
                  height: 350,
                  width: 600,
                ),
                const Divider(
                  height: 40.0,
                  color: Color.fromRGBO(0, 0, 0, 0),
                ),

                const Divider(
                  height: 40.0,
                  color: Color.fromRGBO(74, 14, 14, 0),
                )
              ],
            ),
          ),
        ),
        back: Card(
          elevation: 60.0,
          color: const Color.fromRGBO(255, 255, 255, 0.85),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  height: 30.0,
                  color: Color.fromRGBO(0, 0, 0, 0),
                ),
                // ignore: unnecessary_const
                Image.asset(
                  'images/logo_bagraty.png',
                  height: 100,
                  width: 333,
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
                    padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Connexion()));
                      print("cliqued");
                    },
                    child: const Text(
                      "Commencer",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.bold,
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
