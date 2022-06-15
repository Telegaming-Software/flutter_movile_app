import 'package:flutter/material.dart';

class DrawerUser extends StatefulWidget {
  const DrawerUser({Key? key}) : super(key: key);

  @override
  State<DrawerUser> createState() => _DrawerUserState();
}

class _DrawerUserState extends State<DrawerUser> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
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
            _drawerItem(icon: Icons.book, text: 'Materiales', onpressed: () {
              Navigator.pushNamed(context, 'materialesPage');
            }),
            const SizedBox(height: 10),
            _drawerItem(
                icon: Icons.social_distance_rounded,
                text: 'Coaching',
                onpressed: () {}),


            _drawerItem(
                icon: Icons.book,
                text: 'Añade tu material',
                onpressed: () {
                  Navigator.pushNamed(context, 'addMaterialPage');
                }),



            _drawerItem(
                icon: Icons.money_sharp,
                text: 'Añadir balance',
                onpressed: () {
                  Navigator.pushNamed(context, 'addBalancePage');
                }),

            _drawerItem(
                icon: Icons.exit_to_app_outlined,
                text: 'Cerrar Sesión',
                onpressed: () {}),
          ],
        ),
      ),
    );
  }
}

DrawerHeader _avatar() {
  return const DrawerHeader(
      child: CircleAvatar(
    backgroundImage: NetworkImage(
        'https://i1.sndcdn.com/artworks-000216272705-8tjvzn-t500x500.jpg'),
  ));
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
