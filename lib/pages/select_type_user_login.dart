import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectTypeScreen extends StatefulWidget {
  const SelectTypeScreen({Key? key}) : super(key: key);

  @override
  State<SelectTypeScreen> createState() => _SelectTypeScreenState();
}

class _SelectTypeScreenState extends State<SelectTypeScreen> {
  String typeUser = 'Gamer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '¿Qué tipo de usuario eres?',
                      maxLines: 2,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(20, 31, 106, 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: typeUser == 'Gamer' ? _userStack() : _coachStack(),
                  ),
                  Text(
                    typeUser,
                    maxLines: 2,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(20, 31, 106, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  _loginButton(),
                  const SizedBox(height: 10),
                  _registerButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _userStack() {
    return Stack(
      key: const Key('1'),
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.infinity,
          child: FadeInLeft(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/brand3.jpeg',
                fit: BoxFit.scaleDown,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: -30,
          child: GestureDetector(
            onTap: () {
              setState(() {
                typeUser = 'Coach';
              });
            },
            child: FadeInUp(
              child: const Icon(
                Icons.arrow_right,
                color: Color.fromRGBO(20, 31, 106, 1),
                size: 150,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _coachStack() {
    return Stack(
      key: const Key('2'),
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.infinity,
          child: FadeInRight(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/brand2.jpeg',
                fit: BoxFit.scaleDown,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: -30,
          child: GestureDetector(
            onTap: () {
              setState(() {
                typeUser = 'Gamer';
              });
            },
            child: FadeInUp(
              child: const Icon(
                Icons.arrow_left,
                color: Color.fromRGBO(20, 31, 106, 1),
                size: 150,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        typeUser == 'Gamer'
            ? Navigator.pushNamed(context, 'loginGamer')
            : Navigator.pushNamed(context, 'loginCoach');
      },
      child: const Text(
        'Iniciar Sesión',
        style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        primary: const Color.fromRGBO(20, 31, 106, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 40),
      ),
    );
  }

  Widget _registerButton() {
    return ElevatedButton(
      onPressed: () {
        typeUser == 'Gamer'
            ? Navigator.pushNamed(context, 'registerGamer')
            : Navigator.pushNamed(context, 'registerCoach');
      },
      child: const Text(
        'Registrarse',
        style: TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(20, 31, 106, 1),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Color.fromRGBO(20, 31, 106, 1),
            width: 2,
          ),
        ),
      ),
    );
  }
}
