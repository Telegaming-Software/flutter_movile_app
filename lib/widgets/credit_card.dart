import 'package:flutter/material.dart';
import 'package:tg_softwareapp/utils/responsive.dart';

class CreditCard extends StatefulWidget {
  Responsive responsive;
  String number;
  String fechaExpiracion;
  String cvv;
  String nombreTarjeta;
  CreditCard(
      {Key? key,
      required this.responsive,
      required this.number,
      required this.fechaExpiracion,
      required this.cvv,
      required this.nombreTarjeta})
      : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.responsive.hp(11),
      left: widget.responsive.wp(10),
      right: widget.responsive.wp(10),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: Color.fromRGBO(20, 31, 106, 1)),
        width: widget.responsive.wp(80),
        height: widget.responsive.hp(26),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 20,
              child: Text(
                widget.number,
                style: TextStyle(
                    fontSize: widget.responsive.dp(2.5), color: Colors.white),
              ),
            ),
            Positioned(
              top: 100,
              left: 30,
              child: Text(
                widget.fechaExpiracion,
                style: TextStyle(
                    fontSize: widget.responsive.dp(2), color: Colors.white),
              ),
            ),
            Positioned(
              top: 100,
              right: 30,
              child: Text(
                widget.cvv,
                style: TextStyle(
                    fontSize: widget.responsive.dp(2), color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 60,
              child: Text(
                widget.nombreTarjeta,
                style: TextStyle(
                    fontSize: widget.responsive.dp(2), color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 30,
              child: Icon(Icons.credit_card,
                  size: widget.responsive.dp(2.5), color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
