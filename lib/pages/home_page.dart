import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tg_softwareapp/models/game_model.dart';
import 'package:tg_softwareapp/pages/materiales_page.dart';
import 'package:tg_softwareapp/services/game_service.dart';
import 'package:tg_softwareapp/widgets/drawer_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _gameService = GameService();
  List<Game> games = [];
  void _getGames() async {
    final games = await _gameService.getAllGames();
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
    return Scaffold(
        drawer: const DrawerUser(),
        backgroundColor: const Color.fromRGBO(210, 209, 227, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
          title: const Text(
            'Escoge tu juego',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                physics: const ScrollPhysics(parent: null),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return _itemGame(game: games[index]);
                },
                itemCount: games.length,
              )
            ],
          ),
        ));
  }

  Widget _itemGame({required Game game}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MaterialesPage(
                  gameId: game.id!.toInt(),
                )));
      },
      child: Container(
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
                game.coverUri!,
              ),
            ),
            const SizedBox(width: 55),
            Expanded(
              child: AutoSizeText(game.name!,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 14, 42, 65))),
            )
          ],
        ),
      ),
    );
  }
}
