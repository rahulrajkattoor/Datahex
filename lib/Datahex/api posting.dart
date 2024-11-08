import 'dart:convert';
import 'package:datahex/Datahex/user%20model.dart';
import 'package:http/http.dart' as http;


const String apiUrl = 'https://online-entrance-test-api-umxbq.ondigitalocean.app/api/v1/auth/login';

Future<Use> loginUser(String email, String password) async {
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // Parse the JSON response
    final Use userData = useFromJson(response.body);
    return userData;
  } else {
    throw Exception('Failed to login');
  }
}
