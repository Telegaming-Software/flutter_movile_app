import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool? isAceptedFirstCondition = false;
  bool? isAceptedSecondCondition = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(210, 209, 227, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
      ),
      body: ListView(children: [
        Column(
          children: [
            const SizedBox(height: 15),
            Image.asset(
              'assets/logo.png',
              width: 200,
            ),
            const SizedBox(height: 15),
            const Text('Registro',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xAC0E2A41))),
            const SizedBox(height: 25),
            _nameTextField(),
            const SizedBox(height: 20),
            _emailTextField(),
            const SizedBox(height: 20),
            _passwordTextField(),
            const SizedBox(
              height: 25,
            ),
            _firstCondition(),
            const SizedBox(height: 5),
            _secondCondition(),
            const SizedBox(height: 20),
            _sendButton(),
            const SizedBox(height: 15),
            _alreadyAccount(),
            const SizedBox(height: 10),
          ],
        )
      ]),
    );
  }

  Row _alreadyAccount() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('¿Ya tienes una cuenta?', style: TextStyle(fontSize: 15)),
      InkWell(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, 'login', ((route) => false));
        },
        child: const Text(' Inicia sesión',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 14, 42, 65))),
      ),
    ]);
  }

  ElevatedButton _sendButton() {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(20, 31, 106, 1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ))),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, 'homePage', ((route) => false));
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          child: const Text('Crear cuenta',
              style: TextStyle(fontSize: 16, color: Colors.white)),
        ));
  }

  Container _firstCondition() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
              value: isAceptedFirstCondition,
              onChanged: (valueIn) {
                setState(() {
                  isAceptedFirstCondition = valueIn;
                });
              }),
          const Flexible(
            child: Text(
              'Acepto los terminos, Condiciones y las Políticas de privacidad, soy mayor de 13 años.',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xAC0E2A41)),
            ),
          )
        ],
      ),
    );
  }

  Container _secondCondition() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
              value: isAceptedSecondCondition,
              onChanged: (valueIn) {
                setState(() {
                  isAceptedSecondCondition = valueIn;
                });
              }),
          const Flexible(
            child: Text(
              'Me gustaría recibir promociones y noticias de las actualizacion en mi correo.',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xAC0E2A41)),
            ),
          )
        ],
      ),
    );
  }

  Widget _nameTextField() {
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
              hintText: 'Nombre',
              labelStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
            ),
            onChanged: (value) {},
          ),
        );
      },
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

  Widget _passwordTextField() {
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
              hintText: 'Contraseña',
              labelStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
            ),
            onChanged: (value) {},
          ),
        );
      },
    );
  }
}
