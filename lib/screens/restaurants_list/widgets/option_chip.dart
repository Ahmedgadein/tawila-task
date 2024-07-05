import 'package:flutter/material.dart';

class OptionChip extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;

  const OptionChip({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
      margin: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              size: 12,
              color: color,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}


