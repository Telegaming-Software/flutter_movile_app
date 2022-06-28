import 'package:flutter/material.dart';
import 'package:tg_softwareapp/models/material_training_model.dart';
import 'package:tg_softwareapp/services/material_training_service.dart';
import 'package:tg_softwareapp/utils/responsive.dart';
import 'package:tg_softwareapp/widgets/own_material.dart';

class OwnMaterialsPage extends StatefulWidget {
  final int idUsuario;
  OwnMaterialsPage({Key? key, required this.idUsuario}) : super(key: key);

  @override
  State<OwnMaterialsPage> createState() => _OwnMaterialsPageState();
}

class _OwnMaterialsPageState extends State<OwnMaterialsPage> {
  List<TrainingMaterial> _materiales = [];

  Future<void> _getMaterials() async {
    final MaterialTrainingService service = MaterialTrainingService();
    final List<TrainingMaterial> materiales =
        await service.getByGamer(widget.idUsuario);
    setState(() {
      _materiales = materiales;
    });
  }

  @override
  void initState() {
    super.initState();
    _getMaterials();
  }

  @override
  Widget build(BuildContext context) {
    final response = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
        title: const Text(
          'Mis materiales',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: response.hp(3)),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return OwnMaterial(
                  trainingMaterial: _materiales[index],
                );
              },
              itemCount: _materiales.length,
            ),
          ),
        ],
      ),
    );
  }
}
