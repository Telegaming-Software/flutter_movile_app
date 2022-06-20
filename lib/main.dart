import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tg_softwareapp/router/app_routes.dart';

import 'bloc/usuario/usuario_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsuarioBloc>(
          create: (context) => UsuarioBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TGSoftware',
        initialRoute: AppRoutes.initialRouter,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: AppRoutes.routes,
      ),
    );
  }
}
