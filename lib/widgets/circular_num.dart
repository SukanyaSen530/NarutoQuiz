import 'package:flutter/material.dart';

class CircularNum extends StatelessWidget {
  const CircularNum(this.questionNum,
      {super.key, this.bgColor = const Color.fromARGB(255, 175, 174, 174)});

  final String questionNum;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        questionNum,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

/*
//Can use this as well
 CircleAvatar(
                    backgroundColor: Colors.brown.shade800,
                    child: const Text('AH'),
             ),
 */