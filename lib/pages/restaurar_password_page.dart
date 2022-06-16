import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurarPasswordPage extends StatefulWidget {
  const RestaurarPasswordPage({Key? key}) : super(key: key);

  @override
  State<RestaurarPasswordPage> createState() => _RestaurarPasswordPageState();
}

class _RestaurarPasswordPageState extends State<RestaurarPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: Image.asset(
                'assets/brand6.jpg',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: double.infinity,
              child: Text(
                '¿Olvidaste tu contraseña?',
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(20, 31, 106, 1),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Text(
                'No te preocupes, estas cosas pasan. Solo ingresa tu correo electrónico y te enviaremos un correo con una nueva contraseña.',
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(20, 31, 106, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            _inputEmail(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            _loginButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _inputEmail() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: Row(
        children: [
          const Icon(
            Icons.mail_outline,
            color: Colors.grey,
          ),
          const SizedBox(width: 20),
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email ID',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'Enviar',
        style: GoogleFonts.nunito(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.height * 0.35, 45),
        primary: const Color.fromRGBO(20, 31, 106, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
