import 'package:flutter/material.dart';
import 'package:tg_softwareapp/utils/responsive.dart';

class InputAddMaterial extends StatelessWidget {
  final String titulo;
  final TextInputType? textInputType;
  final void Function(String)? onChanged;
  final IconData icon;
  const InputAddMaterial(
      {Key? key,
      required this.titulo,
      this.textInputType = TextInputType.text,
      this.onChanged,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: responsive.dp(2), vertical: responsive.dp(1)),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: responsive.dp(2)),
          Expanded(
            child: TextFormField(
              keyboardType: textInputType,
              maxLines: textInputType == TextInputType.multiline ? 5 : null,
              onChanged: onChanged,
              decoration: InputDecoration(
                labelText: titulo,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: responsive.dp(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
