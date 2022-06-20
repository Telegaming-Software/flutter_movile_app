import 'package:flutter/material.dart';
import 'package:tg_softwareapp/utils/responsive.dart';
import 'package:tg_softwareapp/widgets/input_credit_card_form.dart';

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
  String numeroTarjeta = '';
  String fechaExpiracion = '';
  String cvv = '';
  String nombreTarjeta = '';
  String cantidadCredito = '';
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
            onChanged: (text) {
              widget.addNumber(text);
            },
          ),
          SizedBox(height: responsive.dp(4)),
          ElevatedButton(
            onPressed: () {},
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
          ),
          SizedBox(height: responsive.dp(3)),
        ],
      ),
    );
  }
}
