import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tg_softwareapp/models/material_training_model.dart';
import 'package:tg_softwareapp/services/material_training_service.dart';
import 'package:tg_softwareapp/widgets/drawer_user.dart';
import 'package:tg_softwareapp/widgets/material_item.dart';

class MaterialesPage extends StatefulWidget {
  final int gameId;
  const MaterialesPage({Key? key, required this.gameId}) : super(key: key);

  @override
  State<MaterialesPage> createState() => _MaterialesPageState();
}

class _MaterialesPageState extends State<MaterialesPage> {
  final _materialTrainingService = MaterialTrainingService();
  List<TrainingMaterial> trainingMaterials = [];
  void _getTrainingMaterials() async {
    final trainingMaterials =
        await _materialTrainingService.getById(gameId: widget.gameId);
    setState(() {
      this.trainingMaterials = trainingMaterials;
    });
  }

  @override
  void initState() {
    super.initState();
    _getTrainingMaterials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerUser(),
      backgroundColor: const Color.fromRGBO(210, 209, 227, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
        title: const Text(
          'Materiales',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                physics: const ScrollPhysics(parent: null),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return MaterialItem(
                      coach: trainingMaterials[index].nameCoach!,
                      coverUri: trainingMaterials[index].trainingCoverUri!,
                      title: trainingMaterials[index].title!,
                      id: trainingMaterials[index].trainingMaterialId!);
                },
                itemCount: trainingMaterials.length),
          ],
        ),
      ),
    );
  }
}
