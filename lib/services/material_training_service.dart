import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tg_softwareapp/models/material_training_model.dart';
import 'package:tg_softwareapp/services/general_service.dart';

class MaterialTrainingService extends GeneralService {
  Future<List<TrainingMaterial>> getById({required int gameId}) async {
    final response = await http.get(
        Uri.parse(
            url + 'trainingMaterials/game/' + gameId.toString() + '/trainings'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<TrainingMaterial> materials = jsonResponse['content']
          .map<TrainingMaterial>((json) => TrainingMaterial.fromJson(json))
          .toList();
      print(materials);
      return materials;
    } else {
      throw Exception('Failed to load games');
    }
  }
}
