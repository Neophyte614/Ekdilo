// ignore: unused_import
import 'package:ekdilo/state_management/favourite_model.dart';
import 'package:ekdilo/ui/homepage.dart';
// ignore: unused_import
import 'package:ekdilo/ui/login_page.dart';
// ignore: unused_import
import 'package:ekdilo/ui/profile_page.dart';
// ignore: unused_import
import 'package:ekdilo/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => FavouriteModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Ekdilo",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
