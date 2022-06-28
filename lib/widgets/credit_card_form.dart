import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tg_softwareapp/bloc/usuario/usuario_bloc.dart';
import 'package:tg_softwareapp/models/gamer.dart';
import 'package:tg_softwareapp/services/gamer_service.dart';
import 'package:tg_softwareapp/utils/responsive.dart';
import 'package:tg_softwareapp/widgets/input_credit_card_form.dart';
import 'package:tg_softwareapp/widgets/load_dialog.dart';

import 'agregar_creditos_satisfactorio.dart';

class CreditCardForm extends StatefulWidget {
  String number;
  final void Function(String text) addNumber;
  final void Function(String text) addFechaExpiracion;
  final void Function(String text) addCvv;
  final void Function(String text) addNombreTarjeta;
  CreditCardForm(
      {Key? key,
      required this.number,
      required this.addNumber,
      required this.addFechaExpiracion,
      required this.addCvv,
      required this.addNombreTarjeta})
      : super(key: key);

  @override
  State<CreditCardForm> createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  double creditos = 0;
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Column(
        children: [
          InputCreditCard(
            label: 'Número de tarjeta',
            keyboadType: TextInputType.number,
            onChanged: (text) {
              widget.addNumber(text);
            },
          ),
          SizedBox(height: responsive.dp(1)),
          Row(
            children: [
              Flexible(
                  child: InputCreditCard(
                label: 'Fecha de expiración',
                keyboadType: TextInputType.datetime,
                onChanged: (text) {
                  widget.addFechaExpiracion(text);
                },
              )),
              const SizedBox(width: 15),
              Flexible(
                child: InputCreditCard(
                  label: 'CVV',
                  keyboadType: TextInputType.number,
                  obscureText: true,
                  onChanged: (text) {
                    widget.addCvv(text);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: responsive.dp(1)),
          InputCreditCard(
            label: 'Propietario',
            onChanged: (text) {
              widget.addNombreTarjeta(text);
            },
          ),
          SizedBox(height: responsive.dp(1)),
          InputCreditCard(
            label: 'Cantidad de créditos a agregar',
            keyboadType: TextInputType.number,
            //TODO: agregar la funcion para añadir balance
            onChanged: (text) {
              if (text.isNotEmpty) {
                creditos = double.parse(text);
              }
            },
          ),
          SizedBox(height: responsive.dp(4)),
          BlocBuilder<UsuarioBloc, UsuarioState>(
            builder: (context, state) {
              if (state is LogedUsuarioState) {
                return ElevatedButton(
                  onPressed: () async {
                    if (creditos > 0) {
                      try {
                        final GamerService service = GamerService();
                        showDialog(
                            context: context,
                            builder: (context) => const LoadDialog());
                        final Gamer responseGamer =
                            await service.updateGamer(Gamer(
                          id: state.usuario.id,
                          name: state.usuario.name,
                          email: state.usuario.email,
                          password: state.usuario.password,
                          birthDate: state.usuario.birthDate,
                          age: 0,
                          balance: state.usuario.balance + creditos,
                        ));
                        Navigator.pop(context);
                        context
                            .read<UsuarioBloc>()
                            .add(LoginUserEvent(responseGamer, state.typeUser));
                        showDialog(
                            context: context,
                            builder: (context) =>
                                const AddCreditsSuccesDialog());
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text('Ups! algo salió mal'),
                                  content: const Text(
                                      'No se pudo agregar el crédito'),
                                  actions: [
                                    ElevatedButton(
                                      child: const Text('Ok'),
                                      onPressed: () => Navigator.pop(context),
                                    )
                                  ],
                                ));
                      }
                    }
                  },
                  child: const Text(
                    'Agregar créditos',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
          SizedBox(height: responsive.dp(3)),
        ],
      ),
    );
  }
}
