import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/dog.dart';
import 'package:dogs/utils/colors_palette.dart';
import 'package:dogs/utils/constants.dart';

class DogCard extends StatelessWidget {
  final Dog dog;

  const DogCard({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsPalette.whiteColor,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: SizedBox(
        height: 170,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Imagen del perro
            Positioned(
              top: -30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  kIsWeb
                      ? dog.image.substring(
                          0,
                          dog.image.indexOf('.jpg') + 4,
                        ) // Recorta la URL para web
                      : dog.image, // Usa la URL completa para móvil
                  width: 140,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Información del perro dentro de la Card
            Positioned(
              left: 140, // Recorremos la informacion alado de la imagen
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nombre del perro
                    Text(
                      dog.dogName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorsPalette.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Descripción del perro
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 210,
                      ), // Limitamos el ancho máximo del texto
                      child: Text(
                        dog.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: ColorsPalette.textSecondary,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Edad del perro
                    Text(
                      ageLabel.replaceAll('_age', dog.age.toString()),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorsPalette.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
