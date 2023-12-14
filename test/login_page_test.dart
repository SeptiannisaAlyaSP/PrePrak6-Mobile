import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latihan_modul6/LoginPage.dart';


void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));
    expect(find.widgetWithText(TextField, 'Email'), findsOneWidget);
    (find.widgetWithText(TextField, 'Password'), findsOneWidget);
  });
}
