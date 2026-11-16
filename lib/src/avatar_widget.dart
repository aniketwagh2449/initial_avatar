import 'package:flutter/material.dart';

class InitialAvatar extends StatelessWidget {
  final String name;
  final double radius;
  final Color backgroundColor;
  final Color textColor;

  const InitialAvatar({
    super.key,
    required this.name,
    this.radius = 25,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  });

  String get initials {
    final parts = name.trim().split(RegExp(r'\s+'));

    if (name.trim().isEmpty) return '';

    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'
          .toUpperCase();
    }

    return parts.first[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: Text(
        initials,
        style: TextStyle(
          color: textColor,
          fontSize: radius * 0.8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}