import 'package:bagraty_project/PopupCardAcidose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';

late String message;

@override
int _selectedIndex = 0;
void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

void setState(Null Function() param0) {}

class QantaiteLait extends StatelessWidget {
  const QantaiteLait({super.key});

  get onChanged => null;

  @override
  Widget build(BuildContext context) {
    Future<void> acidoseClicked() async {
      showPopupCard<String>(
        context: context,
        builder: (context) {
          return PopupCard(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: const PopupCardAcidose(),
          );
        },
        offset: const Offset(-8, 60),
        alignment: Alignment.center,
        useSafeArea: true,
        dimBackground: true,
      );
    }

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
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Quantité du lait',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              DataTable(
                columnSpacing: 70,
                horizontalMargin: 20.0,
                headingRowColor:
                    const WidgetStatePropertyAll(Color(0XFF035B6F)),
                dataRowColor: const WidgetStatePropertyAll(Colors.white),
                columns: const <DataColumn>[
                  DataColumn(
                    headingRowAlignment: MainAxisAlignment.center,
                    label: Text(
                      'UFL',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.white),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'PDIN',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'PDIE',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.white),
                    ),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('Sarah',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text('19',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text('Student',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Alert',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: const Color(0xff708907),
                  minWidth: 2,
                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                  onPressed: () {
                    acidoseClicked();
                  },
                  child: const Text(
                    "Risque d'acidose",
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
      ),
    );
  }
}
