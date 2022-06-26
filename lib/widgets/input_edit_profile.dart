import 'package:flutter/material.dart';
import 'package:tg_softwareapp/utils/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InputEditProfile extends StatefulWidget {
  Responsive responsive;
  String namedInput;
  String label;
  final TextInputType textInputType;
  final void Function(String text)? onChanged;
  InputEditProfile(
      {Key? key,
      required this.responsive,
      required this.namedInput,
      required this.label,
      this.textInputType = TextInputType.text,
      this.onChanged})
      : super(key: key);

  @override
  State<InputEditProfile> createState() => _InputEditProfileState();
}

class _InputEditProfileState extends State<InputEditProfile> {
  DateTime _dataTime = DateTime.now();
  bool _isDate = false;
  String _fecha = '';
  Future<void> _selectDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
      context: context,
      initialDate: _dataTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );

    if (_datePicker != null) {
      setState(() {
        _dataTime = _datePicker;
        _fecha = _dataTime.toIso8601String().substring(0, 10);
        widget.onChanged!(_dataTime.toIso8601String().substring(0, 10));
        _isDate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.responsive.wp(100),
      padding: EdgeInsets.symmetric(
        horizontal: widget.responsive.wp(5),
      ),
      margin: EdgeInsets.symmetric(
        vertical: widget.responsive.dp(2),
      ),
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.namedInput,
            style: GoogleFonts.nunito(
              fontSize: widget.responsive.dp(2),
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(20, 31, 106, 0.8),
            ),
          ),
          SizedBox(height: widget.responsive.dp(1)),
          widget.namedInput != 'Cumpleaños'
              ? TextFormField(
                  keyboardType: widget.textInputType,
                  style: TextStyle(
                    fontSize: widget.responsive.dp(2),
                    color: const Color.fromRGBO(20, 31, 106, 1),
                  ),
                  decoration: InputDecoration(
                    hintText: widget.label,
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(20, 31, 106, 0.8),
                      ),
                    ),
                  ),
                  onChanged: widget.onChanged,
                )
              : GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.responsive.wp(5),
                      vertical: widget.responsive.dp(1.6),
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Text(
                      !_isDate ? widget.label : _fecha,
                      style: TextStyle(
                        fontSize: widget.responsive.dp(2),
                        color: !_isDate
                            ? Colors.black54
                            : const Color.fromRGBO(20, 31, 106, 0.8),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
