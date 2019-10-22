import 'package:flunt_dart/src/validations/contracts/validatable.dart';

mixin Validator<T> {
  checkIsNull(T value) {
    if (value == null) {
      throw Exception(
          "ValidatorException: Este validator não aceita um valor nulo");
    }
    return true;
  }
}

class TrueValidator with Validator<bool> implements IValidate<bool> {
  @override
  bool validate(bool value) {
    checkIsNull(value);
    return value;
  }
}

class FalseValidator with Validator<bool> implements IValidate<bool> {
  @override
  bool validate(bool value) {
    checkIsNull(value);
    if (value == false) return true;
    return false;
  }
}
