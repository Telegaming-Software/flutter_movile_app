import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tg_softwareapp/bloc/usuario/usuario_bloc.dart';
import 'package:tg_softwareapp/models/coach.dart';
import 'package:tg_softwareapp/models/gamer.dart';
import 'package:tg_softwareapp/services/coach_service.dart';
import 'package:tg_softwareapp/services/gamer_service.dart';
import 'package:tg_softwareapp/utils/responsive.dart';
import 'package:tg_softwareapp/widgets/drawer_user.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tg_softwareapp/widgets/input_edit_profile.dart';
import 'package:tg_softwareapp/widgets/load_dialog.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final String profileImage =
      'https://cdn3.vectorstock.com/i/1000x1000/52/97/image-a-person-icon-people-icon-on-blue-vector-27565297.jpg';
  String _nombre = '', _email = '', _password = '', _cumple = '';

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
      ),
      drawer: const DrawerUser(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocBuilder<UsuarioBloc, UsuarioState>(
          builder: (context, state) {
            if (state is LogedUsuarioState) {
              return Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Editar Perfil',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(20, 31, 106, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: responsive.dp(9),
                          backgroundImage: const NetworkImage(
                              'https://i.pinimg.com/564x/42/f2/50/42f2501e2c4b669b0f0c4b7bff4519fc.jpg'),
                        ),
                        Positioned(
                          bottom: responsive.dp(-1),
                          right: responsive.dp(1),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromRGBO(20, 31, 106, 1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                responsive.dp(9),
                              ),
                            ),
                            child: IconButton(
                                iconSize: responsive.dp(4),
                                color: const Color.fromRGBO(20, 31, 106, 1),
                                onPressed: () {},
                                icon: const Icon(Icons.edit)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: responsive.dp(4)),
                  Container(
                    padding: EdgeInsets.only(
                      left: responsive.wp(5),
                    ),
                    width: responsive.wp(100),
                    child: Text(
                      'Información personal',
                      style: GoogleFonts.nunito(
                        fontSize: responsive.dp(2),
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(20, 31, 106, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: responsive.dp(2)),
                  InputEditProfile(
                    responsive: responsive,
                    namedInput: 'Nombre',
                    label: state.usuario.name,
                    onChanged: (text) => _nombre = text,
                  ),
                  InputEditProfile(
                    responsive: responsive,
                    namedInput: 'Email',
                    label: state.usuario.email,
                    onChanged: (text) => _email = text,
                  ),
                  InputEditProfile(
                    responsive: responsive,
                    namedInput: 'Password',
                    label: state.usuario.password,
                    onChanged: (text) => _password = text,
                  ),
                  InputEditProfile(
                    responsive: responsive,
                    namedInput: 'Cumpleaños',
                    label: state.usuario.birthDate,
                    onChanged: (text) => _cumple = text,
                  ),
                  SizedBox(height: responsive.dp(2)),
                  ElevatedButton(
                    onPressed: () async {
                      if (state.typeUser == 'gamer') {
                        final service = GamerService();
                        try {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const LoadDialog();
                              });
                          final Gamer responseGamer = await service.updateGamer(
                            Gamer(
                              id: state.usuario.id,
                              name: _nombre,
                              email: _email,
                              password: _password,
                              birthDate: _cumple,
                              age: 0,
                              balance: state.usuario.balance,
                            ),
                          );
                          context
                              .read<UsuarioBloc>()
                              .add(LoginUserEvent(responseGamer, 'gamer'));
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } catch (e) {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text('Ups! algo salio mal'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              });
                        }
                      } else {
                        final service = CoachService();
                        try {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const LoadDialog();
                              });
                          final Coach responseCoach = await service.updateCoach(
                            Coach(
                              coachId: state.usuario.coachId,
                              name: _nombre,
                              email: _email,
                              password: _password,
                              birthDate: _cumple,
                              age: 0,
                              field: state.usuario.field,
                            ),
                          );
                          context
                              .read<UsuarioBloc>()
                              .add(LoginUserEvent(responseCoach, 'coach'));
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } catch (e) {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Error :('),
                                  content: const Text('Ups! algo salio mal'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              });
                        }
                      }
                    },
                    child: Text(
                      'Guardar',
                      style: GoogleFonts.nunito(
                        fontSize: responsive.dp(2),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(20, 31, 106, 1),
                      minimumSize: Size(
                        responsive.wp(80),
                        responsive.hp(6),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          responsive.dp(2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: responsive.dp(2)),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
