import '../models/dog.dart';
import '../services/api_service.dart';
import '../services/database_service.dart';
import 'package:flutter/foundation.dart';

class DogViewModel {
  List<Dog> dogs = [];

  Future<void> loadDogs() async {
    // Si es web ejecuta la API
    if (kIsWeb) {
      dogs = await ApiService.fetchDogs();
      return;
    }
    // Intenta cargar desde la base de datos
    dogs = await DatabaseService.instance.getDogs();
    if (dogs.isEmpty) {
      // Si la base de datos está vacía, carga desde la API y guarda
      final List<Dog> fetchedDogs = await ApiService.fetchDogs();
      for (final dog in fetchedDogs) {
        await DatabaseService.instance.insertDog(dog);
      }
      dogs = fetchedDogs;
    }
  }
}
