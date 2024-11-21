import 'package:flutter/material.dart';
import '../viewmodels/dog_view_model.dart';
import 'widgets/dog_card.dart';
import 'package:dogs/utils/colors_palette.dart';
import 'package:dogs/utils/constants.dart';

class DogListView extends StatefulWidget {
  const DogListView({super.key});

  @override
  DogListViewState createState() => DogListViewState();
}

class DogListViewState extends State<DogListView> {
  final DogViewModel viewModel = DogViewModel();

  @override
  Widget build(BuildContext context) {
    // Pantalla principal de Listado de Perros
    return Scaffold(
      backgroundColor: ColorsPalette.backgroundPrimary,
      appBar: AppBar(
        title: const Text(dogListTitle),
        backgroundColor: ColorsPalette.backgroundPrimary,
      ),
      body: FutureBuilder(
        future:
            viewModel.loadDogs(), //Buscamos la informacion que queremos mostrar
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            //Teniendo la informacion, pintamos nuestro componente DogCard
            return ListView.builder(
              itemCount: viewModel.dogs.length,
              itemBuilder: (context, index) {
                final dog = viewModel.dogs[index];
                return DogCard(dog: dog);
              },
            );
          }
        },
      ),
    );
  }
}
