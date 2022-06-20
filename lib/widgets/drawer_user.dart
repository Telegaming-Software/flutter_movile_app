import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tg_softwareapp/bloc/usuario/usuario_bloc.dart';

class DrawerUser extends StatefulWidget {
  const DrawerUser({Key? key}) : super(key: key);

  @override
  State<DrawerUser> createState() => _DrawerUserState();
}

class _DrawerUserState extends State<DrawerUser> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (context, state) {
          if (state is LogedUsuarioState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: const Color.fromRGBO(20, 31, 106, 1),
              child: ListView(
                children: [
                  _avatar(),
                  _drawerItem(
                      icon: Icons.home,
                      text: 'Inicio',
                      onpressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'homePage', ((route) => false));
                      }),
                  const SizedBox(height: 10),
                  _drawerItem(
                      icon: Icons.person,
                      text: 'Perfil',
                      onpressed: () {
                        Navigator.pushNamed(context, 'profilePage');
                      }),
                  const SizedBox(height: 10),
                  _drawerItem(
                      icon: Icons.book,
                      text: 'Materiales',
                      onpressed: () {
                        Navigator.pushNamed(context, 'homePage');
                      }),
                  const SizedBox(height: 10),
                  _drawerItem(
                      icon: Icons.social_distance_rounded,
                      text: 'Coaching',
                      onpressed: () {}),
                  const SizedBox(height: 10),
                  state.typeUser != 'gamer'
                      ? _drawerItem(
                          icon: Icons.book,
                          text: 'Añade tu material',
                          onpressed: () {
                            Navigator.pushNamed(context, 'addMaterialPage');
                          })
                      : _drawerItem(
                          icon: Icons.money_sharp,
                          text: 'Añadir balance',
                          onpressed: () {
                            Navigator.pushNamed(context, 'addBalancePage');
                          }),
                  const SizedBox(height: 10),
                  _drawerItem(
                      icon: Icons.exit_to_app_outlined,
                      text: 'Cerrar Sesión',
                      onpressed: () {}),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

DrawerHeader _avatar() {
  return const DrawerHeader(
    child: CircleAvatar(
      backgroundImage: NetworkImage(
          'https://i.pinimg.com/564x/42/f2/50/42f2501e2c4b669b0f0c4b7bff4519fc.jpg'),
    ),
  );
}

ListTile _drawerItem({
  required String text,
  required IconData icon,
  required Function()? onpressed,
}) {
  return ListTile(
    onTap: onpressed,
    hoverColor: Colors.white70,
    leading: Icon(icon, color: Colors.white),
    title:
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 20)),
  );
}
