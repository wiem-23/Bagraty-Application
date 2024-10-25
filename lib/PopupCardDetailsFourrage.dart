// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:math' as math;

class PopupCardDetailsFourrage extends StatelessWidget {
  const PopupCardDetailsFourrage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: math.min(460, MediaQuery.sizeOf(context).width - 16.0),
          minHeight: math.min(700, MediaQuery.sizeOf(context).width - 16.0),
        ),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Quantité par vache",
                style: TextStyle(
                    color: Color(0XFF035B6F),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              DataTable(
                columnSpacing: 70,
                horizontalMargin: 50.0,
                headingRowColor:
                    const WidgetStatePropertyAll(Color(0XFF035B6F)),
                dataRowColor: const WidgetStatePropertyAll(Colors.white),
                columns: const <DataColumn>[
                  DataColumn(
                    headingRowAlignment: MainAxisAlignment.center,
                    label: Text(
                      'Kg Brut',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.white),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Kg MS',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.white),
                    ),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('10',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text('19',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Energie",
                style: TextStyle(
                    color: Color(0XFF035B6F),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
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
                      'UFL Apporté',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.white),
                    ),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('10',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text('19',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Protéines",
                style: TextStyle(
                    color: Color(0XFF035B6F),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              DataTable(
                columnSpacing: 35,
                horizontalMargin: 20.0,
                headingRowColor:
                    const WidgetStatePropertyAll(Color(0XFF035B6F)),
                dataRowColor: const WidgetStatePropertyAll(Colors.white),
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'PDIN',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'PDIN Apporté',
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
                  DataColumn(
                    headingRowAlignment: MainAxisAlignment.center,
                    label: Text(
                      'PDIE Apporté',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.white),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('55',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text('19',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text('74',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text('66',
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color(0xff708907),
                    minWidth: 2,
                    padding: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                    onPressed: () {
                      Navigator.of(context).pop('ff');
                    },
                    child: const Text(
                      "Ok",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ])
            ],
          ),
        ));
  }
}
