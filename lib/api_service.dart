import 'package:api2_pgm_post/modal_class/post_modal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<Createuser> createUser(String name, String job) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'name': name, 'job': job}),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Createuser.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(
        'Failed to create user.'
        '',
      );
    }
  }
}
