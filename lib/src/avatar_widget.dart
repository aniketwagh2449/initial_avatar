
import 'package:flutter/material.dart';

/// A customizable circular avatar that displays user initials
/// or a profile image.
///
/// Supports custom initials, text styling, borders, tap interactions,
/// tooltips, and accessibility labels.
///
/// Example:
/// ```dart
/// InitialAvatar(
///   name: 'John Doe',
///   radius: 30,
///   backgroundColor: Colors.blue,
/// )
/// ```
class InitialAvatar extends StatelessWidget {
  /// The user's full name used to generate initials.
  final String name;

  /// Custom initials to display instead of automatically generated initials.
  ///
  /// If null or empty, initials are generated from [name].
  final String? customInitials;

  /// The radius of the circular avatar.
  ///
  /// Defaults to 25.
  final double radius;

  /// The background color of the avatar.
  ///
  /// Defaults to [Colors.blue].
  final Color backgroundColor;

  /// The color of the initials text.
  ///
  /// Defaults to [Colors.white].
  final Color textColor;

  /// The font size of the initials.
  ///
  /// If null, the font size is calculated using the avatar radius.
  final double? fontSize;

  /// The font weight of the initials text.
  ///
  /// Defaults to [FontWeight.bold].
  final FontWeight fontWeight;

  /// The font style of the initials text.
  ///
  /// Defaults to [FontStyle.normal].
  final FontStyle fontStyle;

  /// The font family used for the initials text.
  ///
  /// Must refer to a font available in the consuming application.
  final String? fontFamily;

  /// The spacing between characters in the initials.
  ///
  /// Defaults to 0.
  final double letterSpacing;

  /// The color of the avatar border.
  ///
  /// Defaults to [Colors.transparent].
  final Color borderColor;

  /// The width of the avatar border.
  ///
  /// Defaults to 0, which means no visible border.
  final double borderWidth;

  /// The profile image displayed inside the avatar.
  ///
  /// When provided, the image is displayed instead of initials.
  final ImageProvider? backgroundImage;

  /// Callback invoked when the avatar is tapped.
  ///
  /// If null, no tap action is performed.
  final VoidCallback? onTap;

  /// Optional tooltip message displayed when the avatar is hovered
  /// or long-pressed.
  final String? tooltip;

  /// Optional accessibility label describing the avatar.
  final String? semanticsLabel;

  /// Creates a customizable circular avatar.
  ///
  /// The [name] parameter is required. All other parameters are optional
  /// and provide customization for the avatar's appearance and behavior.
  ///
  /// The [radius] must be greater than zero, [borderWidth] cannot be
  /// negative, and [fontSize] must be positive when provided.
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

  /// Returns the custom initials or generates initials from [name].
  ///
  /// For names containing multiple words, the first character of the
  /// first and last words is used.
  ///
  /// For example:
  /// - `John Doe` returns `JD`.
  /// - `John` returns `J`.
  /// - `John Paul Smith` returns `JS`.
  /// - An empty name returns an empty string.
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
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }

    return parts.first[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
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

    avatar = GestureDetector(
      onTap: onTap,
      child: avatar,
    );

    if (tooltip != null) {
      avatar = Tooltip(
        message: tooltip!,
        child: avatar,
      );
    }

    if (semanticsLabel != null) {
      avatar = Semantics(
        label: semanticsLabel,
        child: avatar,
      );
    }

    return avatar;
  }
}
