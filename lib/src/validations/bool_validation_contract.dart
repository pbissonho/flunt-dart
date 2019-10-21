import 'package:flunt_dart/src/validations/contracts/validatable.dart';
import 'package:flunt_dart/src/validators/bool_validator.dart';

mixin BoolValidation<T> implements IValidatable {
  void _addValidator(IValidate validate, message);

  void isTrue(String message) {
    _addValidator(TrueValidator(), message);
  }

  void isFalse(String message) {
    _addValidator(FalseValidator(), message);
  }
}
