import 'package:flutter/material.dart';

class AppealButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;

  const AppealButton(
      {super.key,
        required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF5856D6),
            borderRadius: BorderRadius.circular(18)),
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Text(buttonText, style: TextStyle(color: Color(0xFFF5F4F2)),
          ),
        ),
      ),
    );
  }
}
