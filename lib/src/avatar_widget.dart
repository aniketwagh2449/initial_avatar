
import 'package:flutter/material.dart';

class InitialAvatar extends StatelessWidget {
  // User information
  final String name;
  final String? customInitials;

  // Avatar size
  final double radius;

  // Avatar colors
  final Color backgroundColor;
  final Color textColor;

  // Text customization
  final double? fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final String? fontFamily;
  final double letterSpacing;

  // Border customization
  final Color borderColor;
  final double borderWidth;

  // Profile image
  final ImageProvider? backgroundImage;

  // Interaction and accessibility
  final VoidCallback? onTap;
  final String? tooltip;
  final String? semanticsLabel;

  const InitialAvatar({
    super.key,
    required this.name,
    this.customInitials,
    this.radius = 25,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize,
    this.fontWeight = FontWeight.bold,
    this.fontStyle = FontStyle.normal,
    this.fontFamily,
    this.letterSpacing = 0,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.backgroundImage,
    this.onTap,
    this.tooltip,
    this.semanticsLabel,
  })  : assert(radius > 0),
        assert(borderWidth >= 0),
        assert(fontSize == null || fontSize > 0);

  // Generate initials from the user's name
  String get initials {
    if (customInitials != null &&
        customInitials!.trim().isNotEmpty) {
      return customInitials!.trim().toUpperCase();
    }

    final trimmedName = name.trim();

    if (trimmedName.isEmpty) {
      return '';
    }

    final parts = trimmedName.split(RegExp(r'\s+'));

    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'
          .toUpperCase();
    }

    return parts.first[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    // Avatar with circular border
    Widget avatar = Container(
      width: (radius * 2) + (borderWidth * 2),
      height: (radius * 2) + (borderWidth * 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        backgroundImage: backgroundImage,
        child: backgroundImage == null
            ? Text(
                initials,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize ?? radius * 0.8,
                  fontWeight: fontWeight,
                  fontStyle: fontStyle,
                  fontFamily: fontFamily,
                  letterSpacing: letterSpacing,
                ),
              )
            : null,
      ),
    );

    // Handle avatar tap
    avatar = GestureDetector(
      onTap: onTap,
      child: avatar,
    );

    // Add tooltip
    if (tooltip != null) {
      avatar = Tooltip(
        message: tooltip!,
        child: avatar,
      );
    }

    // Add accessibility description
    if (semanticsLabel != null) {
      avatar = Semantics(
        label: semanticsLabel,
        child: avatar,
      );
    }

    return avatar;
  }
}
