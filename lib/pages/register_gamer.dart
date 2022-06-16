import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterGamerPage extends StatefulWidget {
  RegisterGamerPage({Key? key}) : super(key: key);

  @override
  State<RegisterGamerPage> createState() => _RegisterGamerPageState();
}

class _RegisterGamerPageState extends State<RegisterGamerPage> {
  String textBirth = 'Fecha de nacimiento';

  DateTime _dataTime = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
      context: context,
      initialDate: _dataTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );

    if (_datePicker != null) {
      setState(() {
        _dataTime = _datePicker;
        textBirth = _dataTime.toIso8601String().substring(0, 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
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
            _inputName(),
            const SizedBox(height: 20),
            _inputEmail(),
            const SizedBox(height: 20),
            _inputPassword(),
            const SizedBox(height: 20),
            _inputBirth(),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'By signing up, you agree to our Terms of Service and Privacy Policy.',
                maxLines: 3,
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            _signinButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _inputName() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: Row(
        children: [
          const Icon(
            Icons.person_outline,
            color: Colors.grey,
          ),
          const SizedBox(width: 20),
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nombre',
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
            Icons.password_outlined,
            color: Colors.grey,
          ),
          const SizedBox(width: 20),
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Contraseña',
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

  Widget _inputBirth() {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Row(
          children: [
            const Icon(
              Icons.cake,
              color: Colors.grey,
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                child: Text(
                  textBirth,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signinButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'selectTypeUser');
      },
      child: Text(
        'Sign up',
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
