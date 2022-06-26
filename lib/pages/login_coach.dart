import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tg_softwareapp/bloc/usuario/usuario_bloc.dart';
import 'package:tg_softwareapp/models/coach.dart';
import 'package:tg_softwareapp/services/coach_service.dart';
import 'package:tg_softwareapp/widgets/load_dialog.dart';

class LoginCoachPage extends StatefulWidget {
  const LoginCoachPage({Key? key}) : super(key: key);

  @override
  State<LoginCoachPage> createState() => _LoginCoachPageState();
}

class _LoginCoachPageState extends State<LoginCoachPage> {
  final CoachService _coachService = CoachService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<Coach> _loginCoach() async {
    try {
      final Coach coach = await _coachService.loginCoach(
        _emailController.text,
        _passwordController.text,
      );
      return coach;
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Ups! Parece que los datos no son correctos'),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Aceptar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
      throw Exception('Error al iniciar sesión');
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
        child: BlocBuilder<UsuarioBloc, UsuarioState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                SizedBox(
                  child: Image.asset(
                    'assets/brand5.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                // Boton de login
                ElevatedButton(
                  onPressed: () async {
                    try {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const LoadDialog();
                          });
                      Coach alreadyCoach = await _loginCoach();
                      context
                          .read<UsuarioBloc>()
                          .add(LoginUserEvent(alreadyCoach, 'coach'));
                      Navigator.pushReplacementNamed(context, 'homePage');
                    } catch (e) {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Algo salio mal :('),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Aceptar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    }
                  },
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
                    minimumSize:
                        Size(MediaQuery.of(context).size.height * 0.35, 45),
                    primary: const Color.fromRGBO(20, 31, 106, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                // Fin de boton de login
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
                    InkWell(
                      child: Text(
                        'Registrate',
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(20, 31, 106, 1),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'registerCoach');
                      },
                    ),
                  ],
                ),
              ],
            );
          },
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
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
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
              controller: _passwordController,
              obscureText: true,
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
      onPressed: () {
        _loginCoach();
      },
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
