
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:initial_avatar/initial_avatar.dart';

void main() {
  testWidgets('displays user initials', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: InitialAvatar(
            name: 'John Doe',
          ),
        ),
      ),
    );

    expect(find.text('JD'), findsOneWidget);
  });

  testWidgets('displays single name initial', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: InitialAvatar(
            name: 'John',
          ),
        ),
      ),
    );

    expect(find.text('J'), findsOneWidget);
  });
}
