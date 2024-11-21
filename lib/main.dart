import 'package:dogs/views/dog_list_view.dart';
import 'package:dogs/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dogs/utils/colors_palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo Dogs',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: ColorsPalette.whiteColor,
        ),
        routes: {
          '/': (context) => const HomeScreen(), // Ruta inicial
          '/dogList': (context) => const DogListView(), // Ruta para DogListView
        });
  }
}
