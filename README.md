# Initial Avatar

A lightweight and customizable Flutter widget that generates profile avatars using the initials of a user's name.

No additional dependencies required!

## Features

- Automatically generate initials from a name.
- Support single names and full names.
- Customizable avatar radius.
- Custom background color.
- Custom text color.
- Lightweight and easy to use.
- Built with Flutter's `CircleAvatar`.

## Installation

Add the following dependency to your `pubspec.yaml`:

```yaml
dependencies:
  initial_avatar: ^0.0.1
```

Or run:

```bash
flutter pub add initial_avatar
```

## Usage

Import the package:

```dart
import 'package:initial_avatar/initial_avatar.dart';
```

Use the widget:

```dart
const InitialAvatar(
  name: 'John Doe',
  radius: 30,
  backgroundColor: Colors.blue,
  textColor: Colors.white,
)
```

This displays a circular avatar with the initials `JD`.

### Single name

```dart
const InitialAvatar(
  name: 'John',
)
```

This displays `J`.

### Custom colors

```dart
const InitialAvatar(
  name: 'Alex Smith',
  radius: 40,
  backgroundColor: Colors.purple,
  textColor: Colors.white,
)
```

## Parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `name` | String | Required | User's name |
| `radius` | double | 25 | Avatar radius |
| `backgroundColor` | Color | Colors.blue | Background color |
| `textColor` | Color | Colors.white | Initials text color |

## Example

Check the `example` folder for a complete Flutter application demonstrating the package.

## Requirements

- Flutter SDK
- Dart SDK compatible with the package's SDK constraints

## Issues and Contributions

Found a bug or have an idea for improvement?

Please open an issue or submit a pull request on GitHub:

https://github.com/aniketwagh2449/initial_avatar

## License

This project is licensed under the MIT License.