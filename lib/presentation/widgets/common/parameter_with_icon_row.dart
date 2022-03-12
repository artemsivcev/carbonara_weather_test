import 'package:flutter/material.dart';

class ParameterWithIconRow extends StatelessWidget {
  const ParameterWithIconRow({Key? key, required this.icon, required this.text})
      : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text(text),
      ],
    );
  }
}
