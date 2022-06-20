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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Stack(
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.network(
                        'https://cdn3.vectorstock.com/i/1000x1000/52/97/image-a-person-icon-people-icon-on-blue-vector-27565297.jpg',
                        width: 150,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 260,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'profileEditPage');
                      },
                      child: const Icon(
                        Icons.mode_edit_outline_outlined,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            _dataContainer(data: 'Nombre', value: 'Juan Perez'),
            const SizedBox(height: 25),
            _dataContainer(data: 'Apellidos', value: 'Sanchez Maita'),
            const SizedBox(height: 25),
            _dataContainer(data: 'Dirección', value: 'Las golondrinas R11'),
            const SizedBox(height: 25),
            _dataContainer(data: 'Nacimiento', value: '10/12/2000'),
            const SizedBox(height: 25),
            _dataContainer(data: 'Teléfono', value: '+34 654 567 890'),
            const SizedBox(height: 25),
            _dataContainer(data: 'Discord', value: 'AgustinMaita#1774'),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _inGameData(
                    game: 'Counter Strike Global Ofencive',
                    nickname: 'MaiyiProGamer',
                    range: 'Global Elite'),
                _inGameData(
                    game: 'Dota 2',
                    nickname: 'MaiyiProGamer',
                    range: 'Inmortal Top 1')
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Container _dataContainer({required String data, required String value}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.26,
            child: AutoSizeText(
              data,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 20, color: Color.fromRGBO(121, 128, 148, 1)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: AutoSizeText(
                  value,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromRGBO(170, 178, 203, 1)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inGameData(
      {required String game, required String nickname, required String range}) {
    final String _nickname = 'Nick:' + nickname;
    final String _range = 'Rango:' + range;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://i.pinimg.com/originals/c1/ec/da/c1ecda477bc92b6ecfc533b64d4a0337.png',
              width: 100,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(height: 15),
          AutoSizeText(
            _nickname,
            maxLines: 1,
            style: const TextStyle(
                fontSize: 18, color: Color.fromRGBO(121, 128, 148, 1)),
          ),
          const SizedBox(height: 15),
          AutoSizeText(
            _range,
            maxLines: 1,
            style: const TextStyle(
                fontSize: 18, color: Color.fromRGBO(121, 128, 148, 1)),
          ),
        ],
      ),
    );
  }
}
