import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dog.dart';
import 'package:dogs/utils/constants.dart';

class ApiService {
  static Future<List<Dog>> fetchDogs() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Dog.fromMap(json)).toList();
    } else {
      throw Exception(errorApi);
    }
  }
}
