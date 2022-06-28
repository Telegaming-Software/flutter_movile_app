import 'package:flutter/material.dart';
import 'package:tg_softwareapp/utils/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmarCompraMaterialDialog extends StatelessWidget {
  const ConfirmarCompraMaterialDialog({Key? key}) : super(key: key);

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
                  'assets/brand9.jpg',
                )),
            SizedBox(height: responsive.dp(4)),
            Text(
              '¿Estás seguro de que deseas comprar este material?',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: responsive.dp(2.5),
                fontWeight: FontWeight.w600,
                color: Colors.cyan,
              ),
            ),
            SizedBox(height: responsive.dp(2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Cancelar',
                      style: TextStyle(
                          color: Colors.cyan, fontSize: responsive.dp(2))),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.cyan),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text('Confirmar',
                      style: TextStyle(fontSize: responsive.dp(2))),
                  onPressed: () {
                    Navigator.pop(context, true);
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
