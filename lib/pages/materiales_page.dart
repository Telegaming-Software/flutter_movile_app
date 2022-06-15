import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tg_softwareapp/models/material_training_model.dart';
import 'package:tg_softwareapp/services/material_training_service.dart';
import 'package:tg_softwareapp/widgets/drawer_user.dart';

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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 25, top: 20),
              child: const Text('Materiales',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            ListView.builder(
                physics: const ScrollPhysics(parent: null),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return _material(
                    image: trainingMaterials[index].trainingCoverUri!,
                    coach: 'NoneInformation',
                    material: trainingMaterials[index].title!,
                    fecha: '12/12/2020',
                  );
                },
                itemCount: trainingMaterials.length),
          ],
        ),
      ),
    );
  }

  Widget _material(
      {required String image,
      required String coach,
      required String material,
      required String fecha}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'materialInfoPage'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Coach:',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AutoSizeText(
                            coach,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Material:',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AutoSizeText(
                            material,
                            maxLines: 3,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Fecha:',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        AutoSizeText(
                          fecha,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
