import 'dart:io';

import 'package:bagraty_app/Bagraty/AjoutVache.dart';
import 'package:bagraty_app/Bagraty/ListeNourritures.dart';
import 'package:bagraty_app/Bagraty/first_page.dart';
import 'package:bagraty_app/Bagraty/menu.dart';
import 'package:bagraty_app/BagratyArabic/AjoutVacheAR.dart';
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
    return (MaterialApp(locale: const Locale('fr', 'FR'), home: FirstPage()));
  }
}
