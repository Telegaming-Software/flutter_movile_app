import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacementNamed('selectTypeUser');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Image.asset(
                'assets/logo.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: SpinKitFoldingCube(
                color: Colors.white,
                size: 50.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
