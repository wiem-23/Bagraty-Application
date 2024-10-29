import 'dart:io';

import 'package:bagraty_project/Nourriture.dart';
import 'package:bagraty_project/calcul_besoins.dart';
import 'package:bagraty_project/connexion.dart';
import 'package:bagraty_project/inscription.dart';
import 'package:bagraty_project/menu.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (const MaterialApp(
      home: Nourriture(),
    ));
  }
}
