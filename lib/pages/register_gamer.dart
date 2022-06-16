import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterGamerPage extends StatefulWidget {
  RegisterGamerPage({Key? key}) : super(key: key);

  @override
  State<RegisterGamerPage> createState() => _RegisterGamerPageState();
}

class _RegisterGamerPageState extends State<RegisterGamerPage> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(
                'assets/brand7.jpg',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: double.infinity,
              child: Text(
                'Sign up',
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(20, 31, 106, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
