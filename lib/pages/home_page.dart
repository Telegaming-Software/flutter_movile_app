import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tg_softwareapp/widgets/drawer_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: const Text(
                  'Escoge tu juego',
                  style: TextStyle(
                      color: Color.fromRGBO(20, 31, 106, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                physics: const ScrollPhysics(parent: null),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return _itemGame();
                },
                itemCount: 20,
              )
            ],
          ),
        ));
  }

  Widget _itemGame() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://i1.sndcdn.com/artworks-000216272705-8tjvzn-t500x500.jpg',
            ),
          ),
          const SizedBox(width: 55),
          const Expanded(
            child: AutoSizeText('League Of Legends',
                maxLines: 2,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 14, 42, 65))),
          )
        ],
      ),
    );
  }
}
