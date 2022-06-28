import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tg_softwareapp/utils/responsive.dart';

class NotEnoughtCreditsDialog extends StatelessWidget {
  const NotEnoughtCreditsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: responsive.dp(30),
                height: responsive.dp(30),
                child: Image.asset(
                  'assets/brand11.jpg',
                )),
            SizedBox(height: responsive.dp(4)),
            Text(
              'Ups! No tienes creditos para comprar materiales.',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: responsive.dp(2.5),
                fontWeight: FontWeight.w600,
                color: Colors.cyan,
              ),
            ),
            SizedBox(height: responsive.dp(2)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Volver',
                      style: TextStyle(
                          color: Colors.cyan, fontSize: responsive.dp(2))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.cyan),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text('Ir a añadir créditos',
                      maxLines: 2,
                      style: TextStyle(fontSize: responsive.dp(2))),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'addBalancePage');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
