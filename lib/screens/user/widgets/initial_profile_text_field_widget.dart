import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTextField extends StatefulWidget {
  const ProfileTextField({
    required this.hintWord,
    Key? key
  }) : super(key: key);

  final String hintWord;

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: Colors.black
      ),
      decoration: InputDecoration(
        hintText: widget.hintWord,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(10, 9, 10, 10),
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 11,
          color: Color(0xff737373),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(width: 1, color: Color(0xffE1E1E1)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(width: 1, color: Color(0xffE1E1E1)),
        ),
      ),
    );
  }
}
