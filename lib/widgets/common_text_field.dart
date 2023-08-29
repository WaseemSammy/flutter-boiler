import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  CommonTextField({Key? key, required this.controller, required this.label, required this.hint, required this.isPassword}) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isPassword;

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(color: Colors.black,
      ),
       decoration: InputDecoration(
         hintText: widget.hint,
        isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 13,vertical: 13),
        fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none)
          )
      ,
    );
  }
}
