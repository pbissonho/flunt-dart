import 'package:flunt_dart/flunt_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/flutter_flunt.dart';

void teste(String email) {
  var contract = Contract(email, "Email")..isEmail("quando não for");
}

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    var widget = MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        body: Form(
          child: FluntTextFormField(
            errorFormatType: ErrorFormatType.both,
            contract: (value) => Contract(value, "Nome"),
          ),
        ),
      ),
    );

    await tester.pumpWidget(widget);
  });
}
