# Initial Avatar

A lightweight, reusable and customizable Flutter widget that displays user initials inside a circular avatar.

`InitialAvatar` allows developers to customize avatar size, colors, text styles, borders, profile images and tap interactions.

No additional third-party dependencies required!

## Features

- Automatically generate initials from a user's name.
- Support single names and full names.
- Provide custom initials.
- Customize avatar radius and background color.
- Customize text color, font size, font weight and font family.
- Customize font style and letter spacing.
- Add circular borders with custom colors and widths.
- Display profile images using `ImageProvider`.
- Handle avatar tap events using `onTap`.
- Display tooltips.
- Support accessibility descriptions using semantic labels.
- Lightweight implementation using Flutter's built-in widgets.

## Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  initial_avatar: ^0.0.2
```

Or run:

```bash
flutter pub add initial_avatar
```

Use the version currently published on pub.dev.

## Import

```dart
import 'package:initial_avatar/initial_avatar.dart';
```

## Basic Usage

Create an avatar using a user's name:

```dart
const InitialAvatar(
  name: 'John Doe',
)
```

This displays a circular avatar with the initials `JD`.

For a single name:

```dart
const InitialAvatar(
  name: 'John',
)
```

This displays `J`.

## Customization Examples

### 1. Customize Avatar Size and Colors

```dart
const InitialAvatar(
  name: 'Aniket Wagh',
  radius: 35,
  backgroundColor: Colors.green,
  textColor: Colors.white,
)
```

### 2. Customize Initials

You can manually provide initials using `customInitials`.

```dart
const InitialAvatar(
  name: 'Aniket Wagh',
  customInitials: 'ANW',
  radius: 35,
)
```

When valid custom initials are provided, they take priority over automatically generated initials.

### 3. Customize Text Style

```dart
const InitialAvatar(
  name: 'Aniket Wagh',
  radius: 35,
  fontSize: 24,
  fontWeight: FontWeight.w900,
  fontStyle: FontStyle.italic,
  fontFamily: 'Roboto',
  letterSpacing: 2,
  textColor: Colors.white,
)
```

### 4. Add a Circular Border

```dart
const InitialAvatar(
  name: 'Aniket Wagh',
  radius: 35,
  backgroundColor: Colors.blue,
  borderColor: Colors.green,
  borderWidth: 3,
)
```

### 5. Display a Profile Image

You can display an image instead of initials using `backgroundImage`.

Using a network image:

```dart
InitialAvatar(
  name: 'Aniket Wagh',
  radius: 35,
  backgroundImage: const NetworkImage(
    'https://example.com/profile.jpg',
  ),
)
```

Using an asset image:

```dart
InitialAvatar(
  name: 'Aniket Wagh',
  radius: 35,
  backgroundImage: const AssetImage(
    'assets/images/profile.png',
  ),
)
```

When a background image is provided, the initials text is not displayed.

### 6. Handle Avatar Tap Events

Use `onTap` to perform an action when the avatar is tapped.

```dart
InitialAvatar(
  name: 'Aniket Wagh',
  onTap: () {
    debugPrint('Avatar tapped');
  },
)
```

### 7. Add a Tooltip

```dart
const InitialAvatar(
  name: 'Aniket Wagh',
  tooltip: 'View Aniket profile',
)
```

### 8. Add an Accessibility Label

```dart
const InitialAvatar(
  name: 'Aniket Wagh',
  semanticsLabel: 'Aniket Wagh profile avatar',
)
```

## All Available Parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `name` | String | Required | User's name |
| `customInitials` | String? | null | Manually provide initials |
| `radius` | double | 25 | Avatar radius |
| `backgroundColor` | Color | Colors.blue | Avatar background color |
| `textColor` | Color | Colors.white | Initials text color |
| `fontSize` | double? | null | Custom text size; defaults to 80% of radius |
| `fontWeight` | FontWeight | FontWeight.bold | Text thickness |
| `fontStyle` | FontStyle | FontStyle.normal | Normal or italic text |
| `fontFamily` | String? | null | Custom font family |
| `letterSpacing` | double | 0 | Spacing between letters |
| `borderColor` | Color | Colors.transparent | Circular border color |
| `borderWidth` | double | 0 | Circular border thickness |
| `backgroundImage` | ImageProvider? | null | Profile image |
| `onTap` | VoidCallback? | null | Callback when avatar is tapped |
| `tooltip` | String? | null | Tooltip displayed on interaction |
| `semanticsLabel` | String? | null | Accessibility description |

## Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:initial_avatar/initial_avatar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Initial Avatar Demo'),
        ),
        body: Center(
          child: InitialAvatar(
            name: 'Aniket Wagh',
            radius: 40,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w900,
            borderColor: Colors.black,
            borderWidth: 3,
            letterSpacing: 1,
            tooltip: 'Aniket Wagh',
            semanticsLabel: 'Aniket Wagh profile avatar',
            onTap: () {
              debugPrint('Avatar tapped');
            },
          ),
        ),
      ),
    );
  }
}
```

## Requirements

- Flutter SDK.
- Dart SDK compatible with the package's SDK constraints.

## Example Application

Check the `example` directory for a complete Flutter application demonstrating how to use the package.

## Issues and Contributions

Found a bug or have an idea for improvement?

Please open an issue or submit a pull request on GitHub:

[GitHub Repository](https://github.com/aniketwagh2449/initial_avatar)

## License

This project is licensed under the MIT License.

See the `LICENSE` file for details.

---

**Initial Avatar** – Simple, reusable and customizable profile avatars for Flutter applications.