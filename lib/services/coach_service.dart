import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tg_softwareapp/models/coach.dart';
import 'package:tg_softwareapp/services/general_service.dart';

class CoachService extends GeneralService {
  Future<Coach> loginCoach(String email, String password) async {
    final response = await http.post(Uri.parse(url + 'coaches/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final Coach coach = Coach.fromJson(jsonResponse);
      return coach;
    } else {
      throw Exception('Failed to load coach');
    }
  }

  Future<Coach> registerCoach(String name, String email, String password,
      String field, String birthDate) async {
    final response = await http.post(Uri.parse(url + 'coaches'),
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'field': field,
          'birthDate': birthDate,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final Coach coach = Coach.fromJson(jsonResponse);
      return coach;
    } else {
      throw Exception('Failed to load coach');
    }
  }
}
