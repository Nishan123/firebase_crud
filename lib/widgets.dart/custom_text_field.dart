import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData suffixIcon;
  final String hintText;
  const CustomTextField({
    super.key,
    required this.suffixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.black26,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: Icon(
              suffixIcon,
              color: Colors.white,
            )),
            style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
