import 'package:flutter/material.dart';
import 'package:dogs/utils/constants.dart';
import 'package:dogs/utils/colors_palette.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Creamos un Home para probar funcionalidad de persistencia de Datos
    return Scaffold(
      appBar: AppBar(
        title: const Text(homeTitle),
        backgroundColor: ColorsPalette.whiteColor,
      ),
      backgroundColor: ColorsPalette.whiteColor,
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 60),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/dogList');
          },
          child: const Text(buttonTitle),
        ),
      ),
    );
  }
}
