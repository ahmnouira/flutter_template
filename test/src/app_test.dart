import 'package:flutter/material.dart';
import 'package:flutter_template/src/app.dart' as app;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing the app widget', () {
    testWidgets(
      'Making sure sure that the root widget is rendered',
      (tester) async {
        await tester.pumpWidget(
          const app.App(),
        );
        expect(find.byType(MaterialApp), findsOneWidget);
      },
    );
  });
}
