part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioState {
  const UsuarioState();
}

class UsuarioInitial extends UsuarioState {}

class LogedUsuarioState extends UsuarioState {
  // ignore: prefer_typing_uninitialized_variables
  final usuario;
  final String typeUser;
  const LogedUsuarioState(this.usuario, this.typeUser);
}
