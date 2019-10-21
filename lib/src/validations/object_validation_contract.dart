import 'package:flunt_dart/src/validations/contracts/validatable.dart';
import 'package:flunt_dart/src/validators/object_validator.dart';

mixin ObjectValidation<T> implements IValidatable {
  void _addValidator(IValidate validate, message);

  void isNull(String message) {
    _addValidator(NullValidator(), message);
  }

  void isNotNull(String message) {
    _addValidator(NotNullValidator(), message);
  }

  void when(bool when(T value), String message) {
    _addValidator(WhenValidator(when), message);
  }
}
