import 'package:cake_baru/app/modules/home/views/layar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart'; // Update the import path accordingly

void main() {
  testWidgets('Mylayar Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Mylayar(),
    ));

    // Verify that the initial UI shows the title 'STORE BAKERY'.
    expect(find.text('STORE BAKERY'), findsOneWidget);

    // Verify that the 'Login' and 'Register' buttons are present.
    expect(find.text('Login'), findsOneWidget);

    // Example: Tap the 'Login' button and verify navigation.
    await tester.tap(find.text('Login'));
    await tester.pump();
  });
}
