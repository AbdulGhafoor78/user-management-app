import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modules/user_model.dart';

class ApiService {

  Future<List<UserModel>> fetchUsers() async {

    final response = await http.get(
      Uri.parse(
        "https://jsonplaceholder.typicode.com/users",
      ),
    );

    if (response.statusCode == 200) {

      final List<dynamic> jsonData =
      jsonDecode(response.body);

      return jsonData
          .map(
            (user) => UserModel.fromJson(user),
      )
          .toList();

    } else {
      throw Exception("Failed to load users");
    }
  }
}