import 'dart:io';

import 'package:bagraty_project/Bagraty/AjoutVache.dart';
import 'package:bagraty_project/Bagraty/ListeNourritures.dart';
import 'package:bagraty_project/Bagraty/calculBesoinsConcentes.dart';
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
    return (MaterialApp(
        locale: const Locale('fr', 'FR'),
        // Ajoutez les localisation delegates pour le support de la langue

        /* supportedLocales: [
          Locale('fr', 'FR'), // Support pour le français
          Locale('en', 'US'), // Support pour l'anglais (optionnel)
        ], */
        home: Ajoutvache()));
  }
}
