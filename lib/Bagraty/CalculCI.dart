import 'package:bagraty_project/Bagraty/sqlHelper.dart';
import 'package:flutter/material.dart';

class Calculci extends StatefulWidget {
 int? id ;
  Calculci({super.key, required id, required ci, required thi});
  @override
  CalculciState createState() => CalculciState();
}

class CalculciState extends State<Calculci> {


  @override
  void initState() {
    super.initState();
  }

List<Map<String, dynamic>> _vache = [];
 void _refreshVache(dynamic id) async {
    final data = await SQLHelper.getVache(id: id);
    setState(() {
      _vache = data;
     
    });
  }
    void _showResult(int? id) async {
    if (id != null) {
     
      final existingVache =
          _vache.firstWhere((element) => element['id_v'] == id);
  
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
                  Text(ci)
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
            child: Column(
              children: [Text(data[]), Text('thi' ${_thi})],
            )));
  }
}
