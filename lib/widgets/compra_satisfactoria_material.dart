import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tg_softwareapp/bloc/usuario/usuario_bloc.dart';
import 'package:tg_softwareapp/pages/own_materials_page.dart';
import 'package:tg_softwareapp/utils/responsive.dart';

class SuccesBuyDialog extends StatelessWidget {
  const SuccesBuyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: responsive.dp(30),
                height: responsive.dp(30),
                child: Image.asset(
                  'assets/brand10.jpg',
                )),
            SizedBox(height: responsive.dp(4)),
            Text(
              '¡Excelente! Ahora puedes ver el material en la sección de "Materiales".',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: responsive.dp(2.5),
                fontWeight: FontWeight.w600,
                color: Colors.cyan,
              ),
            ),
            SizedBox(height: responsive.dp(2)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Volver',
                      style: TextStyle(
                          color: Colors.cyan, fontSize: responsive.dp(2))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.cyan),
                    ),
                  ),
                ),
                BlocBuilder<UsuarioBloc, UsuarioState>(
                  builder: (context, state) {
                    if (state is LogedUsuarioState) {
                      return ElevatedButton(
                        child: Text('Ir a la sección de "Materiales"',
                            maxLines: 2,
                            style: TextStyle(fontSize: responsive.dp(2))),
                        onPressed: () {
                          if (state.typeUser == 'gamer') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OwnMaterialsPage(
                                  idUsuario: state.usuario.id,
                                  isGamer: true,
                                ),
                              ),
                            );
                          } else if (state.typeUser == 'coach') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OwnMaterialsPage(
                                  idUsuario: state.usuario.coachId,
                                  isGamer: false,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                        ),
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
