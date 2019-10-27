
import 'package:flutter/material.dart';
import 'package:flutter_flunt/flutter_flunt.dart';
import 'package:flunt_dart/flunt_dart.dart';

class NameContract extends Contract<String> {
  NameContract(String value, String name) : super(value, name) {
      isNotEmpty("not should be empty");
      hasMaxLen(40, "should have no more than 40 chars");
      hasMinLen(3, "should have at least 3 chars");
  }
}

class FormExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Form(
       child: Column(children: <Widget>[
         FluntTextFormField(
           contract: (String value) => NameContract(value, "Name"),
         ),
       ],)
     ),
    );
  }
}
