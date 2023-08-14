import 'package:flutter/material.dart';

class DarkButton extends StatelessWidget {
  const DarkButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // Background color
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            buttonText,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
