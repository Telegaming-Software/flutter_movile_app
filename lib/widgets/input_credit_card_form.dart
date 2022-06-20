import 'package:flutter/material.dart';

class InputCreditCard extends StatelessWidget {
  final String label;
  final TextInputType keyboadType;
  final bool obscureText;
  final void Function(String text)? onChanged;
  const InputCreditCard(
      {Key? key,
      this.label = '',
      this.keyboadType = TextInputType.text,
      this.obscureText = false,
      this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboadType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
