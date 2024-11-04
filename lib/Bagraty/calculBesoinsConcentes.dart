/* import 'dart:math';

import 'package:bagraty_project/Bagraty/calculBesoinsFourrages.dart';
import 'package:bagraty_project/Bagraty/first_page.dart';
import 'package:bagraty_project/Bagraty/menu.dart';
import 'package:bagraty_project/Bagraty/sqlHelper.dart';
import 'package:flutter/material.dart';

class CalculBesoinsConcentres extends StatefulWidget {
  const CalculBesoinsConcentres({Key? key}) : super(key: key);

  @override
  _CalculBesoinsConcentresState createState() =>
      _CalculBesoinsConcentresState();
}

class _CalculBesoinsConcentresState extends State<CalculBesoinsConcentres> {
  // All journals
  List<Map<String, dynamic>> _nourritures = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshNourritures() async {
    final data = await SQLHelper.getConcentresItems();
    print(data);
    setState(() {
      _nourritures = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshNourritures();
    // Loading the diary when the app starts
  }

  final TextEditingController _quantiteController = TextEditingController();
  final TextEditingController _uflController = TextEditingController();
  final TextEditingController _ndfController = TextEditingController();
  final TextEditingController _pdieController = TextEditingController();
  final TextEditingController _pdinController = TextEditingController();
  final TextEditingController _msController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showQuantity(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingNourriture =
          _nourritures.firstWhere((element) => element['id_n'] == id);

      _quantiteController.text = existingNourriture['quantite'].toString();
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 50,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Changer la quantité du concentré',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff708907))),
                  TextField(
                    controller: _quantiteController,
                    decoration: const InputDecoration(
                      hintText: 'Qantité',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                    minWidth: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xff708907),
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }

                      // Clear the text fields

                      _quantiteController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();

                      MyTableWidget(id_n: id);
                    },
                    child: Text(
                      id == null ? 'Ajouter Concentré' : 'Ajouter',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // QantiteLaitWidget()
                ],
              ),
            ));
  }

  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingNourriture =
          _nourritures.firstWhere((element) => element['id_n'] == id);

      _quantiteController.text = existingNourriture['quantite'].toString();
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 50,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Ajouter un concentré',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff708907))),
                  TextField(
                    controller: _nomController,
                    decoration: const InputDecoration(
                      hintText: 'Nom',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
                  TextField(
                      controller: _msController,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Color(0XFF035B6F)),
                        hoverColor: Color(0XFF035B6F),
                        hintText: 'MS %',
                      )),
                  TextField(
                    controller: _uflController,
                    decoration: const InputDecoration(
                      hintText: 'UFL',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
                  TextField(
                    controller: _pdieController,
                    decoration: const InputDecoration(
                      hintText: 'PDIE',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
                  TextField(
                    controller: _pdinController,
                    decoration: const InputDecoration(
                      hintText: 'PDIN',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
                  TextField(
                    controller: _ndfController,
                    decoration: const InputDecoration(
                      hintText: 'NDF',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                    minWidth: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xff708907),
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }

                      // Clear the text fields

                      _quantiteController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();

                      MyTableWidget(id_n: id);
                    },
                    child: Text(
                      id == null ? 'Ajouter Concentré' : 'Ajouter',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ));
  }

  void _showTable(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingNourriture =
          _nourritures.firstWhere((element) => element['id_n'] == id);

      // _quantiteController.text = existingNourriture['quantite'].toString();
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 50,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  MyTableWidget(id_n: id),
                  SizedBox(
                    height: 30,
                  ),
                  // QantiteLaitWidget(),
                  MaterialButton(
                    padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                    minWidth: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xff708907),
                    onPressed: () async {
                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Sortir',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ],
              ),
            ));
  }

// Insert a new journal to the database
  Future<void> _addItem() async {
    await SQLHelper.createConcentreItem(
        motif_n: "fourrage",
        nom_n: _nomController.text,
        ms_n: double.parse(_msController.text),
        ufl_n: double.parse(_uflController.text),
        pdin_n: int.parse(_pdinController.text),
        pdie_n: int.parse(_pdieController.text),
        ndf_n: int.parse(_ndfController.text),
        quantite: 0);
    print(_uflController.text);
    /*  await SQLHelper.createItem(
        id_n: 12,
        motif_n: "fourrage",
        nom_n: "Foin de luzerne",
        ms_n: 87.5,
        ufl_n: 0.73,
        pdin_n: 130,
        pdie_n: 90,
        ndf_n: 425,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 2,
        motif_n: "concentre",
        nom_n: "Pulpe de Betterave",
        ms_n: 28,
        ufl_n: 1.01,
        pdin_n: 60,
        pdie_n: 84,
        ndf_n: 200,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 3,
        motif_n: "concentre",
        nom_n: "Orge grain",
        ms_n: 86.7,
        ufl_n: 1.09,
        pdin_n: 79,
        pdie_n: 101,
        ndf_n: 110,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 4,
        motif_n: "concentre",
        nom_n: "Soja grain",
        ms_n: 90,
        ufl_n: 1.3,
        pdin_n: 180,
        pdie_n: 160,
        ndf_n: 200,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 5,
        motif_n: "concentre",
        nom_n: "Grignons d’Olive",
        ms_n: 90,
        ufl_n: 0.85,
        pdin_n: 85,
        pdie_n: 70,
        ndf_n: 300,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 6,
        motif_n: "concentre",
        nom_n: "Maïs grain",
        ms_n: 86,
        ufl_n: 1.1,
        pdin_n: 80,
        pdie_n: 95,
        ndf_n: 130,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 7,
        motif_n: "concentre",
        nom_n: "Maïs grain",
        ms_n: 89,
        ufl_n: 0.88,
        pdin_n: 150,
        pdie_n: 140,
        ndf_n: 200,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 8,
        motif_n: "fourrage",
        nom_n: "Foin d’avoine",
        ms_n: 86.8,
        ufl_n: 0.65,
        pdin_n: 50,
        pdie_n: 65,
        ndf_n: 520,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 9,
        motif_n: "fourrage",
        nom_n: "Paille d'Orge",
        ms_n: 88,
        ufl_n: 0.44,
        pdin_n: 46,
        pdie_n: 24,
        ndf_n: 780,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 10,
        motif_n: "fourrage",
        nom_n: "Ensilage Maïs Faible Valeur",
        ms_n: 35,
        ufl_n: 0.85,
        pdin_n: 67,
        pdie_n: 42,
        ndf_n: 495,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 11,
        motif_n: "fourrage",
        nom_n: "Foin de vesce-avoine",
        ms_n: 81,
        ufl_n: 0.67,
        pdin_n: 67,
        pdie_n: 74,
        ndf_n: 575,
        quantite: 0);

    await SQLHelper.createItem(
        id_n: 13,
        motif_n: "fourrage",
        nom_n: "Sulla en vert",
        ms_n: 18,
        ufl_n: 0.88,
        pdin_n: 108,
        pdie_n: 98,
        ndf_n: 300,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 14,
        motif_n: "fourrage",
        nom_n: "Maïs grain",
        ms_n: 89,
        ufl_n: 0.88,
        pdin_n: 150,
        pdie_n: 140,
        ndf_n: 200,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 15,
        motif_n: "fourrage",
        nom_n: "Foin de ray-grass",
        ms_n: 68.8,
        ufl_n: 0.58,
        pdin_n: 48,
        pdie_n: 61,
        ndf_n: 600,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 16,
        motif_n: "fourrage",
        nom_n: "Raquette de cactus âgée",
        ms_n: 11.5,
        ufl_n: 0.44,
        pdin_n: 39,
        pdie_n: 16,
        ndf_n: 385,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 17,
        motif_n: "fourrage",
        nom_n: "Feuilles et rameaux d’olivier",
        ms_n: 20,
        ufl_n: 0.55,
        pdin_n: 45,
        pdie_n: 50,
        ndf_n: 350,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 18,
        motif_n: "fourrage",
        nom_n: "Azolla",
        ms_n: 17.5,
        ufl_n: 1,
        pdin_n: 145,
        pdie_n: 90,
        ndf_n: 275,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 19,
        motif_n: "concentre",
        nom_n: "Concentré N7 ACN",
        ms_n: 88,
        ufl_n: 10.75,
        pdin_n: 130,
        pdie_n: 90,
        ndf_n: 425,
        quantite: 0); */

    _refreshNourritures();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(id, int.parse(_quantiteController.text));
    print(int.parse(_quantiteController.text));
    _refreshNourritures();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Color(0XFF035B6F),
      content: Text('Nourriture supprimée avec succés'),
    ));
    _refreshNourritures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 30),
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
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _nourritures.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: ListTile(
                      isThreeLine: true,
                      minLeadingWidth: 100.0,
                      minTileHeight: 1,
                      minVerticalPadding: 1,
                      horizontalTitleGap: 1.0,
                      title: Text(
                        _nourritures[index]['nom_n'],
                        style: const TextStyle(
                            color: Color(0XFF035B6F),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      subtitle: Text(_nourritures[index]['quantite'].toString(),
                          style: const TextStyle(
                              color: Color(0xff708907),
                              fontWeight: FontWeight.bold)),
                      trailing: SizedBox(
                        width: 120,
                        child: Row(
                          children: [
                            IconButton(
                                color: Color(0XFF035B6F),
                                iconSize: 18,
                                icon: const Icon(Icons.remove_red_eye),
                                onPressed: () => {
                                      _showTable(_nourritures[index]['id_n']),
                                    }),
                            IconButton(
                              color: Color(0XFF035B6F),
                              iconSize: 18,
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _showQuantity(_nourritures[index]['id_n']),
                            ),
                            IconButton(
                              color: Color(0XFF035B6F),
                              iconSize: 18,
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteItem(_nourritures[index]['id_n']),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFF035B6F),
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        onPressed: () => {_showForm(null)},
      ),
    );
  }
}
 */
import 'dart:math';

import 'package:bagraty_project/Bagraty/Apports.dart';
import 'package:bagraty_project/Bagraty/sqlHelper.dart';
import 'package:bagraty_project/Bagraty/sqlHelper.dart';

import 'package:flutter/material.dart';

class CalculBesoinsConcentres extends StatefulWidget {
  const CalculBesoinsConcentres({Key? key}) : super(key: key);

  @override
  _CalculBesoinsConcentresState createState() =>
      _CalculBesoinsConcentresState();
}

class _CalculBesoinsConcentresState extends State<CalculBesoinsConcentres> {
  // All journals
  List<Map<String, dynamic>> _nourritures = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshNourritures() async {
    final data = await SQLHelper.getConcentresItems();
    setState(() {
      _nourritures = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshNourritures();
    // Loading the diary when the app starts
  }

  final TextEditingController _quantiteController = TextEditingController();
  final TextEditingController _uflController = TextEditingController();
  final TextEditingController _ndfController = TextEditingController();
  final TextEditingController _pdieController = TextEditingController();
  final TextEditingController _pdinController = TextEditingController();
  final TextEditingController _msController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showQuantity(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingNourriture =
          _nourritures.firstWhere((element) => element['id_n'] == id);

      _quantiteController.text = existingNourriture['quantite'].toString();
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 50,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Changer la quantité du fourrage',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff708907))),
                  TextField(
                    controller: _quantiteController,
                    decoration: const InputDecoration(
                      hintText: 'Qantité',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                    minWidth: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xff708907),
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }

                      // Clear the text fields

                      _quantiteController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();

                      MyTableWidget(id_n: id);
                    },
                    child: Text(
                      id == null ? 'Ajouter fourrage' : 'Ajouter',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ));
  }

  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingNourriture =
          _nourritures.firstWhere((element) => element['id_n'] == id);

      _quantiteController.text = existingNourriture['quantite'].toString();
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 50,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Ajouter un concentré',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff708907))),
                  TextField(
                    controller: _nomController,
                    decoration: const InputDecoration(
                      hintText: 'Nom',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
                  TextField(
                      controller: _msController,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Color(0XFF035B6F)),
                        hoverColor: Color(0XFF035B6F),
                        hintText: 'MS %',
                      )),
                  TextField(
                    controller: _uflController,
                    decoration: const InputDecoration(
                      hintText: 'UFL',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
                  TextField(
                    controller: _pdieController,
                    decoration: const InputDecoration(
                      hintText: 'PDIE',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
                  TextField(
                    controller: _pdinController,
                    decoration: const InputDecoration(
                      hintText: 'PDIN',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
                  TextField(
                    controller: _ndfController,
                    decoration: const InputDecoration(
                      hintText: 'NDF',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    minWidth: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xff708907),
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }

                      // Clear the text fields

                      _quantiteController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();

                      MyTableWidget(id_n: id);
                    },
                    child: Text(
                      id == null ? 'Ajouter Concentré' : 'Ajouter',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ));
  }

  void _showTable(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingNourriture =
          _nourritures.firstWhere((element) => element['id_n'] == id);

      // _quantiteController.text = existingNourriture['quantite'].toString();
    }

    showModalBottomSheet(
        context: context,
        elevation: 6,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 50,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTableWidget(id_n: id),
                  SizedBox(
                    height: 50,
                  ),
                  Apports(),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                    minWidth: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xff708907),
                    onPressed: () async {
                      // Close the bottom sheet
                      Navigator.of(context).pop();
                      await SQLHelper().calculateTotalSommeTow();
                    },
                    child: const Text(
                      'Sortir',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  )
                ],
              ),
            ));
  }

// Insert a new journal to the database
  Future<void> _addItem() async {
    await SQLHelper.createFourrageItem(
        motif_n: "concentré",
        nom_n: _nomController.text,
        ms_n: double.parse(_msController.text),
        ufl_n: double.parse(_uflController.text),
        pdin_n: int.parse(_pdinController.text),
        pdie_n: int.parse(_pdieController.text),
        ndf_n: int.parse(_ndfController.text),
        quantite: 0);
    print("add");

    await SQLHelper.createItem(
        id_n: 2,
        motif_n: "concentre",
        nom_n: "Pulpe de Betterave",
        ms_n: 28,
        ufl_n: 1.01,
        pdin_n: 60,
        pdie_n: 84,
        ndf_n: 200,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 3,
        motif_n: "concentre",
        nom_n: "Orge grain",
        ms_n: 86.7,
        ufl_n: 1.09,
        pdin_n: 79,
        pdie_n: 101,
        ndf_n: 110,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 4,
        motif_n: "concentre",
        nom_n: "Soja grain",
        ms_n: 90,
        ufl_n: 1.3,
        pdin_n: 180,
        pdie_n: 160,
        ndf_n: 200,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 5,
        motif_n: "concentre",
        nom_n: "Grignons d’Olive",
        ms_n: 90,
        ufl_n: 0.85,
        pdin_n: 85,
        pdie_n: 70,
        ndf_n: 300,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 6,
        motif_n: "concentre",
        nom_n: "Maïs grain",
        ms_n: 86,
        ufl_n: 1.1,
        pdin_n: 80,
        pdie_n: 95,
        ndf_n: 130,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 7,
        motif_n: "concentre",
        nom_n: "Maïs grain",
        ms_n: 89,
        ufl_n: 0.88,
        pdin_n: 150,
        pdie_n: 140,
        ndf_n: 200,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 8,
        motif_n: "fourrage",
        nom_n: "Foin d’avoine",
        ms_n: 86.8,
        ufl_n: 0.65,
        pdin_n: 50,
        pdie_n: 65,
        ndf_n: 520,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 9,
        motif_n: "fourrage",
        nom_n: "Paille d'Orge",
        ms_n: 88,
        ufl_n: 0.44,
        pdin_n: 46,
        pdie_n: 24,
        ndf_n: 780,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 10,
        motif_n: "fourrage",
        nom_n: "Ensilage Maïs Faible Valeur",
        ms_n: 35,
        ufl_n: 0.85,
        pdin_n: 67,
        pdie_n: 42,
        ndf_n: 495,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 11,
        motif_n: "fourrage",
        nom_n: "Foin de vesce-avoine",
        ms_n: 81,
        ufl_n: 0.67,
        pdin_n: 67,
        pdie_n: 74,
        ndf_n: 575,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 12,
        motif_n: "fourrage",
        nom_n: "Foin de luzerne",
        ms_n: 87.5,
        ufl_n: 0.67,
        pdin_n: 130,
        pdie_n: 90,
        ndf_n: 425,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 13,
        motif_n: "fourrage",
        nom_n: "Sulla en vert",
        ms_n: 18,
        ufl_n: 0.88,
        pdin_n: 108,
        pdie_n: 98,
        ndf_n: 300,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 14,
        motif_n: "fourrage",
        nom_n: "Maïs grain",
        ms_n: 89,
        ufl_n: 0.88,
        pdin_n: 150,
        pdie_n: 140,
        ndf_n: 200,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 15,
        motif_n: "fourrage",
        nom_n: "Foin de ray-grass",
        ms_n: 68.8,
        ufl_n: 0.58,
        pdin_n: 48,
        pdie_n: 61,
        ndf_n: 600,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 16,
        motif_n: "fourrage",
        nom_n: "Raquette de cactus âgée",
        ms_n: 11.5,
        ufl_n: 0.44,
        pdin_n: 39,
        pdie_n: 16,
        ndf_n: 385,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 17,
        motif_n: "fourrage",
        nom_n: "Feuilles et rameaux d’olivier",
        ms_n: 20,
        ufl_n: 0.55,
        pdin_n: 45,
        pdie_n: 50,
        ndf_n: 350,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 18,
        motif_n: "fourrage",
        nom_n: "Azolla",
        ms_n: 17.5,
        ufl_n: 1,
        pdin_n: 145,
        pdie_n: 90,
        ndf_n: 275,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 19,
        motif_n: "concentre",
        nom_n: "Concentré N7 ACN",
        ms_n: 88,
        ufl_n: 10.75,
        pdin_n: 130,
        pdie_n: 90,
        ndf_n: 425,
        quantite: 0);

    _refreshNourritures();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(id, int.parse(_quantiteController.text));
    print(int.parse(_quantiteController.text));
    _refreshNourritures();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Color(0XFF035B6F),
      content: Text('Nourriture supprimée avec succés'),
    ));
    _refreshNourritures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 30),
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
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _nourritures.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: ListTile(
                      isThreeLine: true,
                      minLeadingWidth: 100.0,
                      minTileHeight: 1,
                      minVerticalPadding: 1,
                      horizontalTitleGap: 1.0,
                      title: Text(
                        _nourritures[index]['nom_n'],
                        style: const TextStyle(
                            color: Color(0XFF035B6F),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      subtitle: Text(_nourritures[index]['quantite'].toString(),
                          style: const TextStyle(
                              color: Color(0xff708907),
                              fontWeight: FontWeight.bold)),
                      trailing: SizedBox(
                        width: 120,
                        child: Row(
                          children: [
                            IconButton(
                              color: Color(0XFF035B6F),
                              iconSize: 18,
                              icon: const Icon(Icons.remove_red_eye),
                              onPressed: () =>
                                  _showTable(_nourritures[index]['id_n']),
                            ),
                            IconButton(
                              color: Color(0XFF035B6F),
                              iconSize: 18,
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _showQuantity(_nourritures[index]['id_n']),
                            ),
                            IconButton(
                              color: Color(0XFF035B6F),
                              iconSize: 18,
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteItem(_nourritures[index]['id_n']),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFF035B6F),
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
