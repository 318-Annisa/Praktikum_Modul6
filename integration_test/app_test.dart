import 'package:cake_baru/app/modules/home/views/layar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding
      .ensureInitialized(); // Ensure initialization
//code test
  setUpAll(() async {
    // Initialize Firebase
    await Firebase.initializeApp();
    Get.putAsync(() async => await SharedPreferences.getInstance());
  });
  testWidgets('LoginPage Integration Test', (WidgetTester tester) async {
    await tester
        .pumpWidget(const MyWidget()); // Replace with your main app widget

    await tester.pumpAndSettle(); // Wait for the app to settle

    // Navigate to the login page
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Example: Enter email and password in the text fields.
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');
  });
}
