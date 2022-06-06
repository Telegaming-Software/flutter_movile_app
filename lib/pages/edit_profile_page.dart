import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tg_softwareapp/widgets/drawer_user.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final String profileImage =
      'https://i1.sndcdn.com/artworks-000216272705-8tjvzn-t500x500.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
      ),
      drawer: const DrawerUser(),
      backgroundColor: const Color.fromRGBO(210, 209, 227, 1),
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
              height: 150,
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(profileImage),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: _chargePhoto(),
                    bottom: -5,
                    right: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _nameData(),
            const SizedBox(height: 20),
            _lastNameData(),
            const SizedBox(height: 20),
            _adressData(),
            const SizedBox(height: 20),
            _birthData(),
            const SizedBox(height: 20),
            _phoneData(),
            const SizedBox(height: 20),
            _discordData(),
            const SizedBox(height: 20),
            _game1NameData(),
            const SizedBox(height: 20),
            _nick1Data(),
            const SizedBox(height: 20),
            _game2NameData(),
            const SizedBox(height: 20),
            _nick2Data(),
            const SizedBox(height: 30),
            _saveButton(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _saveButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(20, 31, 106, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {},
        child: const Text('Guardar',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }

  Widget _chargePhoto() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'profilePage');
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: const Color.fromRGBO(20, 31, 106, 1),
        padding: const EdgeInsets.all(10),
      ),
      child: const Icon(
        Icons.add_a_photo,
        color: Colors.white,
        size: 25,
      ),
    );
  }

  Widget _nameData() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.26,
            child: const AutoSizeText(
              'Nombres:',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(121, 128, 148, 1)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Nombres',
                    hintStyle: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(170, 178, 203, 1)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _lastNameData() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.26,
            child: const AutoSizeText(
              'Apellidos:',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(121, 128, 148, 1)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Nombres',
                    hintStyle: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(170, 178, 203, 1)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _adressData() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.26,
            child: const AutoSizeText(
              'Dirección:',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(121, 128, 148, 1)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Nombres',
                    hintStyle: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(170, 178, 203, 1)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _birthData() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.26,
            child: const AutoSizeText(
              'Nacimiento:',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(121, 128, 148, 1)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Nombres',
                    hintStyle: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(170, 178, 203, 1)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _phoneData() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.26,
            child: const AutoSizeText(
              'Teléfono:',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(121, 128, 148, 1)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Nombres',
                    hintStyle: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(170, 178, 203, 1)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _discordData() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.26,
            child: const AutoSizeText(
              'Discord:',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(121, 128, 148, 1)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Nombres',
                    hintStyle: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(170, 178, 203, 1)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _game1NameData() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.26,
            child: const AutoSizeText(
              'Juego 1:',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(121, 128, 148, 1)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Nombres',
                    hintStyle: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(170, 178, 203, 1)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nick1Data() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.26,
            child: const AutoSizeText(
              'Nickname 1:',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(121, 128, 148, 1)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Nombres',
                    hintStyle: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(170, 178, 203, 1)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _game2NameData() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.26,
            child: const AutoSizeText(
              'Juego 2:',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(121, 128, 148, 1)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Nombres',
                    hintStyle: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(170, 178, 203, 1)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nick2Data() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.26,
            child: const AutoSizeText(
              'Nickname 2:',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(121, 128, 148, 1)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Nombres',
                    hintStyle: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(170, 178, 203, 1)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
