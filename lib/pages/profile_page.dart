import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tg_softwareapp/bloc/usuario/usuario_bloc.dart';
import '../widgets/drawer_user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerUser(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
        elevation: 0,
      ),
      body: SingleChildScrollView(child:
          BlocBuilder<UsuarioBloc, UsuarioState>(builder: (context, state) {
        if (state is UsuarioInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LogedUsuarioState) {
          return Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    color: const Color.fromRGBO(20, 31, 106, 1),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    left: 30,
                    top: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/564x/42/f2/50/42f2501e2c4b669b0f0c4b7bff4519fc.jpg',
                              scale: 1.5),
                          radius: 50,
                        ),
                        const SizedBox(width: 20),
                        Text(state.usuario.name,
                            style: GoogleFonts.nunito(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              _userData('Email:', state.usuario.name),
              _userData('Birth date:', state.usuario.birthDate),
              state.typeUser == 'gamer'
                  ? _userData('Balance:', state.usuario.balance.toString())
                  : _userData('Field:', state.usuario.field),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ElevatedButton(
                onPressed: () {},
                child: AutoSizeText('Editar perfil',
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width - 50, 50)),
              ),
            ],
          );
        }
        return const Center(
          child: Text('We have some trouble'),
        );
      })),
    );
  }

  Widget _userData(String title, String data) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(20, 31, 106, 1))),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  data,
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
