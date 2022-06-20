import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioInitial()) {
    on<LoginUserEvent>((event, emit) {
      emit(LogedUsuarioState(event.usuario, event.typeUser));
    });
  }
}
