import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;

  const AddButton({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFF5F4F2),
            ),
          ),
        ),
      ),
    );
  }
}
