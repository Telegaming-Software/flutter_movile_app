import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tg_softwareapp/bloc/usuario/usuario_bloc.dart';
import 'package:tg_softwareapp/services/gamer_service.dart';
import 'package:tg_softwareapp/widgets/compra_satisfactoria_material.dart';
import 'package:tg_softwareapp/widgets/load_dialog.dart';

import 'confirmar_compra_material.dart';

class MaterialItem extends StatelessWidget {
  String coverUri;
  String title;
  String coach;
  int id;

  MaterialItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.coach,
      required this.coverUri})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: MediaQuery.of(context).size.height * 0.39,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(coverUri),
              ),
              borderRadius: const BorderRadiusDirectional.only(
                topEnd: Radius.circular(15),
                topStart: Radius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AutoSizeText(
              title,
              maxLines: 2,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.person_pin, color: Colors.black),
                const SizedBox(width: 10),
                AutoSizeText(
                  coach,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          BlocBuilder<UsuarioBloc, UsuarioState>(
            builder: (context, state) {
              if (state is LogedUsuarioState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      bool isBuyed = await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) =>
                              const ConfirmarCompraMaterialDialog());
                      if (isBuyed) {
                        try {
                          //TODO: implementar el método de compra del material
                          final buyService = GamerService();
                          showDialog(
                              context: context,
                              builder: (context) => const LoadDialog());
                          await buyService.purchaseMaterialTrining(
                              state.usuario.id, id);
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) => const SuccesBuyDialog());
                        } catch (e) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Oh no!'),
                                  content: const Text(
                                      'No se pudo comprar el material'),
                                  actions: [
                                    ElevatedButton(
                                      child: const Text('Ok'),
                                      onPressed: () => Navigator.pop(context),
                                    )
                                  ],
                                );
                              });
                        }
                      }
                    },
                    child: const Text('Comprar ahora',
                        style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(00, 182, 185, 1),
                        minimumSize: const Size(double.infinity, 40)),
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
