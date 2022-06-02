import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: const Color.fromRGBO(210, 209, 227, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
      ),
      body: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: 900,
        width: 900,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Image.network(
                  'https://i1.sndcdn.com/artworks-000216272705-8tjvzn-t500x500.jpg',
                  width: 200,
                  alignment: Alignment.center,
                ),
              ),
              const Expanded(
                  child: Text('Username',
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 14, 42, 65))),
              )
        ],
      ),
        /*const Text('Profile',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: Colors.black)),*/
      )
    );
  }


  }
