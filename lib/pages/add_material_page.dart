import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tg_softwareapp/bloc/usuario/usuario_bloc.dart';
import 'package:tg_softwareapp/models/game_model.dart';
import 'package:tg_softwareapp/services/game_service.dart';
import 'package:tg_softwareapp/services/material_training_service.dart';
import 'package:tg_softwareapp/utils/responsive.dart';
import 'package:tg_softwareapp/widgets/compra_satisfactoria_material.dart';
import 'package:tg_softwareapp/widgets/drawer_user.dart';
import 'package:tg_softwareapp/widgets/input_add_material.dart';
import 'package:tg_softwareapp/widgets/load_dialog.dart';

class AddMaterialPage extends StatefulWidget {
  const AddMaterialPage({Key? key}) : super(key: key);

  @override
  State<AddMaterialPage> createState() => _AddMaterialPageState();
}

class _AddMaterialPageState extends State<AddMaterialPage> {
  String titulo = '';
  String description = '';
  double precio = 0;
  String image = '';
  List<Game> games = [];
  int? _selectedGame;

  Future<void> _getGames() async {
    final service = GameService();
    final games = await service.getAllGames();
    setState(() {
      this.games = games;
    });
  }

  @override
  void initState() {
    super.initState();
    _getGames();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      drawer: const DrawerUser(),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
        title: const Text('Añade tus Materiales'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: responsive.hp(2)),
            InputAddMaterial(
              titulo: 'Titulo del material',
              icon: Icons.title,
              onChanged: (value) => titulo = value,
            ),
            InputAddMaterial(
              titulo: 'Descripción',
              textInputType: TextInputType.multiline,
              icon: Icons.description,
              onChanged: (value) => description = value,
            ),
            InputAddMaterial(
              titulo: 'Precio',
              textInputType: TextInputType.number,
              icon: Icons.attach_money,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  precio = double.parse(value);
                }
              },
            ),
            InputAddMaterial(
              titulo: 'Link de la imagen',
              icon: Icons.image,
              onChanged: (value) => image = value,
            ),
            SizedBox(height: responsive.dp(2)),
            DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<int>(
                  hint: const Text('Selecciona un juego'),
                  value: _selectedGame,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedGame = value;
                    });
                  },
                  items: games.map((game) {
                    return DropdownMenuItem(
                      value: game.id,
                      child: Row(
                        children: [
                          Image.network(game.coverUri!,
                              height: responsive.dp(3),
                              width: responsive.dp(3)),
                          SizedBox(width: responsive.dp(2)),
                          AutoSizeText(
                            game.name!,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: responsive.dp(5)),
            BlocBuilder<UsuarioBloc, UsuarioState>(
              builder: (context, state) {
                if (state is LogedUsuarioState) {
                  return ElevatedButton(
                    onPressed: () async {
                      try {
                        final service = MaterialTrainingService();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const LoadDialog();
                            });
                        await service.addMaterial(
                            title: titulo,
                            trainingDescription: description,
                            value: precio,
                            trainingCoverUri: image,
                            gameId: _selectedGame!,
                            coachId: state.usuario.coachId);
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (context) => const SuccesBuyDialog());
                      } catch (e) {
                        Navigator.pop(context);
                        print(e.toString());
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content:
                                    const Text('No se pudo añadir el material'),
                                actions: [
                                  ElevatedButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    },
                    child: AutoSizeText(
                      'Añadir',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: responsive.dp(2.5),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      minimumSize: Size(responsive.wp(80), responsive.hp(5)),
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
