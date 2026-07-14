import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_management_app/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const UserManagementApp());

    expect(find.text('User Management App'), findsOneWidget);
  });
}


