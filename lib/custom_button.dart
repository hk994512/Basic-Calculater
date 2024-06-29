import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.icon, required this.result});
  final IconData icon;
  final Function() result;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.pink),
        onPressed: result,
        child: Icon(icon));
  }
}
