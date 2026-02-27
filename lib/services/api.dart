import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/taskmodal.dart';

class Taskservice {
  Future<List<TaskModal>> fetchtask() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    if (response.statusCode == 200) {
      final List decoded = jsonDecode(response.body);

      final List<TaskModal> tasks = decoded
          .map((json) => TaskModal.fromJson(json))
          .toList(); // ⭐ MOST IMPORTANT LINE

      return tasks;
    } else {
      throw Exception("API failed");
    }
  }
}
