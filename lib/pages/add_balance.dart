import 'package:flutter/material.dart';
import 'package:tg_softwareapp/utils/responsive.dart';
import 'package:tg_softwareapp/widgets/credit_card.dart';
import 'package:tg_softwareapp/widgets/credit_card_form.dart';
import 'package:tg_softwareapp/widgets/drawer_user.dart';

class AddBalancePage extends StatefulWidget {
  const AddBalancePage({Key? key}) : super(key: key);

  @override
  State<AddBalancePage> createState() => _AddBalancePageState();
}

class _AddBalancePageState extends State<AddBalancePage> {
  String number = '';
  String fechaExpiracion = '';
  String cvv = '';
  String nombreTarjeta = '';
  void addnumber(String text) {
    setState(() {
      number = text;
    });
  }

  void addfechaExpiracion(String text) {
    setState(() {
      fechaExpiracion = text;
    });
  }

  void addcvv(String text) {
    setState(() {
      cvv = text;
    });
  }

  void addnombreTarjeta(String text) {
    setState(() {
      nombreTarjeta = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const DrawerUser(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: responsive.height,
          child: Stack(
            children: [
              CreditCard(
                  responsive: responsive,
                  number: number,
                  cvv: cvv,
                  fechaExpiracion: fechaExpiracion,
                  nombreTarjeta: nombreTarjeta),
              CreditCardForm(
                number: number,
                addNumber: addnumber,
                addFechaExpiracion: addfechaExpiracion,
                addCvv: addcvv,
                addNombreTarjeta: addnombreTarjeta,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
