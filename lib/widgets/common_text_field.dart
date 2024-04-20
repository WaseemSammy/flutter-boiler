import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({Key? key, required this.controller, required this.label, required this.hint, required this.isPassword}) : super(key: key);

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
      style: const TextStyle(color: Colors.black,
      ),

       decoration: InputDecoration(
         hintText: widget.hint,
        isDense: true, contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none),

          )
      ,
    );
  }
}
