import 'package:flutter/material.dart';

class RestaurarPasswordPage extends StatefulWidget {
  const RestaurarPasswordPage({Key? key}) : super(key: key);

  @override
  State<RestaurarPasswordPage> createState() => _RestaurarPasswordPageState();
}

class _RestaurarPasswordPageState extends State<RestaurarPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(210, 209, 227, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 15),
              Image.asset(
                'assets/logo.png',
                width: 200,
              ),
              const SizedBox(height: 15),
              const Text('Restaurar contraseña',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xAC0E2A41))),
              const SizedBox(height: 35),
              _emailTextField(),
              const SizedBox(height: 35),
              _sendButton(),
              const SizedBox(height: 15),
              _backButton(),
              const SizedBox(height: 45),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'registerPage');
                },
                child: const Text('Registrate',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 14, 42, 65))),
              ),
              const SizedBox(height: 25),
            ],
          )
        ],
      ),
    );
  }

  Widget _emailTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          width: 350,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.white)),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email',
              labelStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
            ),
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  Widget _sendButton() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(20, 31, 106, 1)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ))),
            onPressed: null,
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              child: const Text('Enviar Correo',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ));
      },
    );
  }

  Widget _backButton() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(20, 31, 106, 1)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ))),
            onPressed: null,
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              child: const Text('Regresar',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ));
      },
    );
  }
}
