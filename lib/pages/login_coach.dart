import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginCoachPage extends StatefulWidget {
  LoginCoachPage({Key? key}) : super(key: key);

  @override
  State<LoginCoachPage> createState() => _LoginCoachPageState();
}

class _LoginCoachPageState extends State<LoginCoachPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'assets/brand5.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: double.infinity,
              child: Text(
                'Login',
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(20, 31, 106, 1),
                  ),
                ),
              ),
            ),
            _inputEmail(),
            const SizedBox(height: 20),
            _inputPassword(),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  InkWell(
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(20, 31, 106, 1),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'restaurarPassword');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            _loginButton(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿Nuevo aqui? ',
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text('Registrate',
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(20, 31, 106, 1),
                      ),
                    )),
              ],
            ),
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

  Widget _inputPassword() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: Row(
        children: [
          const Icon(
            Icons.password,
            color: Colors.grey,
          ),
          const SizedBox(width: 20),
          Flexible(
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                hintText: 'Password',
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
        'Login',
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
