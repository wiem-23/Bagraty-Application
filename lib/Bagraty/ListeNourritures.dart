// ignore_for_file: file_names, library_private_types_in_public_api, non_constant_identifier_names

import 'package:bagraty_app/Bagraty/Apports.dart';
import 'package:bagraty_app/Bagraty/sqlHelper.dart';
import 'package:flutter/material.dart';

class Listenourritures extends StatefulWidget {
  final String id_v;
  const Listenourritures({super.key, required this.id_v});

  @override
  _ListenourrituresState createState() => _ListenourrituresState();
}

class _ListenourrituresState extends State<Listenourritures> {
  // All journals
  List<Map<String, dynamic>> _nourritures = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshNourritures() async {
    /* await SQLHelper.createItem(
        id_n: 1,
        motif_n: "concentre",
        nom_n: "Pulpe de Betterave",
        ms_n: 28,
        ufl_n: 1.01,
        pdin_n: 60,
        pdie_n: 84,
        ndf_n: 200,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 2,
        motif_n: "concentre",
        nom_n: "Orge grain",
        ms_n: 86.7,
        ufl_n: 1.09,
        pdin_n: 79,
        pdie_n: 101,
        ndf_n: 110,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 3,
        motif_n: "concentre",
        nom_n: "Soja grain",
        ms_n: 90,
        ufl_n: 1.3,
        pdin_n: 180,
        pdie_n: 160,
        ndf_n: 200,
        quantite: 0); 
    await SQLHelper.createItem(
        id_n: 4,
        motif_n: "concentre",
        nom_n: "Grignons d’Olive",
        ms_n: 90,
        ufl_n: 0.85,
        pdin_n: 85,
        pdie_n: 70,
        ndf_n: 300,
        quantite: 0);*/
    /* await SQLHelper.createItem(
        id_n: 5,
        motif_n: "concentre",
        nom_n: "Maïs grain",
        ms_n: 86,
        ufl_n: 1.1,
        pdin_n: 80,
        pdie_n: 95,
        ndf_n: 130,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 6,
        motif_n: "concentre",
        nom_n: "Maïs grain",
        ms_n: 89,
        ufl_n: 0.88,
        pdin_n: 150,
        pdie_n: 140,
        ndf_n: 200,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 7,
        motif_n: "fourrage",
        nom_n: "Foin d’avoine",
        ms_n: 86.8,
        ufl_n: 0.65,
        pdin_n: 50,
        pdie_n: 65,
        ndf_n: 520,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 8,
        motif_n: "fourrage",
        nom_n: "Paille d'Orge",
        ms_n: 88,
        ufl_n: 0.44,
        pdin_n: 46,
        pdie_n: 24,
        ndf_n: 780,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 9,
        motif_n: "fourrage",
        nom_n: "Ensilage Maïs Faible Valeur",
        ms_n: 35,
        ufl_n: 0.85,
        pdin_n: 67,
        pdie_n: 42,
        ndf_n: 495,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 10,
        motif_n: "fourrage",
        nom_n: "Foin de vesce-avoine",
        ms_n: 81,
        ufl_n: 0.67,
        pdin_n: 67,
        pdie_n: 74,
        ndf_n: 575,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 11,
        motif_n: "fourrage",
        nom_n: "Foin de luzerne",
        ms_n: 87.5,
        ufl_n: 0.67,
        pdin_n: 130,
        pdie_n: 90,
        ndf_n: 425,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 12,
        motif_n: "fourrage",
        nom_n: "Sulla en vert",
        ms_n: 18,
        ufl_n: 0.88,
        pdin_n: 108,
        pdie_n: 98,
        ndf_n: 300,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 13,
        motif_n: "fourrage",
        nom_n: "Maïs grain",
        ms_n: 89,
        ufl_n: 0.88,
        pdin_n: 150,
        pdie_n: 140,
        ndf_n: 200,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 14,
        motif_n: "fourrage",
        nom_n: "Foin de ray-grass",
        ms_n: 68.8,
        ufl_n: 0.58,
        pdin_n: 48,
        pdie_n: 61,
        ndf_n: 600,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 15,
        motif_n: "fourrage",
        nom_n: "Raquette de cactus âgée",
        ms_n: 11.5,
        ufl_n: 0.44,
        pdin_n: 39,
        pdie_n: 16,
        ndf_n: 385,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 16,
        motif_n: "fourrage",
        nom_n: "Feuilles et rameaux d’olivier",
        ms_n: 20,
        ufl_n: 0.55,
        pdin_n: 45,
        pdie_n: 50,
        ndf_n: 350,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 17,
        motif_n: "fourrage",
        nom_n: "Azolla",
        ms_n: 17.5,
        ufl_n: 1,
        pdin_n: 145,
        pdie_n: 90,
        ndf_n: 275,
        quantite: 0);
    await SQLHelper.createItem(
        id_n: 18,
        motif_n: "concentre",
        nom_n: "Concentré N7 ACN",
        ms_n: 88,
        ufl_n: 0.75,
        pdin_n: 130,
        pdie_n: 90,
        ndf_n: 425,
        quantite: 0);
 */
    final data = await SQLHelper.getItems();
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
  final TextEditingController motifController = TextEditingController();
  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _reloadQuantity(int? id) async {
    if (id != null) {
      final existingNourriture =
          _nourritures.firstWhere((element) => element['id_n'] == id);

      _quantiteController.text = existingNourriture['quantite'].toString();
      // id == null -> create new item
      // id != null -> update an existing item
      await SQLHelper.reloadItem(
          existingNourriture['id_n'], existingNourriture['quantite']);
    }
    setState(() {
      _refreshNourritures();
    });
  }

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
                  const Text('Changer la quantité du ration',
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
                  const SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
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
                      id == null ? 'Ajouter ration' : 'Ajouter',
                      style: const TextStyle(color: Colors.white),
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
                  const Text('Ajouter ration',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff708907))),
                  TextField(
                    controller: motifController,
                    decoration: const InputDecoration(
                      hintText: 'Motif',
                      hintStyle: TextStyle(color: Color(0XFF035B6F)),
                      hoverColor: Color(0XFF035B6F),
                    ),
                  ),
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
                    padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
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
                      id == null ? 'Ajouter Ration' : 'Ajouter',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ));
  }

  void _showTable(int? id, String? id_v) async {
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
                bottom: MediaQuery.of(context).viewInsets.bottom + 30,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTableWidget(id_n: id),
                  const SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
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
    await SQLHelper.createItem(
        motif_n: motifController.text,
        nom_n: _nomController.text,
        ms_n: double.parse(_msController.text),
        ufl_n: double.parse(_uflController.text),
        pdin_n: int.parse(_pdinController.text),
        pdie_n: int.parse(_pdieController.text),
        ndf_n: int.parse(_ndfController.text),
        quantite: 0);

    _refreshNourritures();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(id, double.parse(_quantiteController.text));

    _refreshNourritures();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Color(0XFF035B6F),
      content: Text('Element supprimé avec succés'),
    ));
    _refreshNourritures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          'Rations',
          style: TextStyle(
              fontSize: 16.0,
              color: Color(0XFF035B6F),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
          child: Column(children: [
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      //   padding: const EdgeInsets.all(0),
                      scrollDirection: Axis.vertical,
                      itemCount: _nourritures.length,
                      itemBuilder: (context, index) => Card(
                        color: Colors.white,
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: ListTile(
                            contentPadding:
                                EdgeInsets.only(right: -10, left: 5),
                            leading: SizedBox(
                              width: 30,
                              child: Text(
                                _nourritures[index]['quantite'].toString(),
                                style: const TextStyle(
                                    color: Color(0XFF708908),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                            isThreeLine: true,
                            //  minLeadingWidth: 4.0,
                            minTileHeight: 2,
                            minVerticalPadding: 3,
                            horizontalTitleGap: 0,
                            title: SizedBox(
                                child: Text(
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              _nourritures[index]['nom_n'].toString(),
                              style: TextStyle(
                                  letterSpacing: 0.001,
                                  color: Color(0XFF035B6F),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 11),
                            )),
                            subtitle:
                                Text(_nourritures[index]['motif_n'].toString(),
                                    style: const TextStyle(
                                      color: Color(0xff708907),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    )),
                            trailing: SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                      color: const Color(0XFF035B6F),
                                      iconSize: 14,
                                      icon: const Icon(Icons.refresh_rounded),
                                      onPressed: () => {
                                            _reloadQuantity(
                                              _nourritures[index]['id_n'],
                                            )
                                          }),
                                  IconButton(
                                    color: const Color(0XFF035B6F),
                                    iconSize: 16,
                                    icon: const Icon(Icons.remove_red_eye),
                                    onPressed: () => _showTable(
                                        _nourritures[index]['id_n'],
                                        widget.id_v),
                                  ),
                                  IconButton(
                                    color: const Color(0XFF035B6F),
                                    iconSize: 16,
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => _showQuantity(
                                        _nourritures[index]['id_n']),
                                  ),
                                  IconButton(
                                    color: const Color(0XFF035B6F),
                                    iconSize: 16,
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => _deleteItem(
                                        _nourritures[index]['id_n']),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
            ),
            const SizedBox(
              height: 30,
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
                      builder: (context) => Apports(id_v: widget.id_v)));
                },
                child: const Text(
                  "Apports",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0XFF035B6F),
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
