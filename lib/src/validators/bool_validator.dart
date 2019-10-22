import 'package:flunt_dart/src/validations/contracts/validatable.dart';

class TrueValidator implements IValidate<bool> {
  @override
  bool validate(bool value) {
    return value;
  }
}

class FalseValidator implements IValidate<bool> {
  @override
  bool validate(bool value) {
    if (value == false) return true;
    return false;
  }
}
