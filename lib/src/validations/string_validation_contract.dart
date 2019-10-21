import 'package:flunt_dart/src/validations/contracts/validatable.dart';
import 'package:flunt_dart/src/validators/string_validator.dart';

mixin StringValidation<T> implements IValidatable {
  void _addValidator(IValidate validate, message);

  void exactLen(int length, String message) {
    _addValidator(HasExactLengthValidator(length), message);
  }

  void hasMaxLen(int min, String message) {
    _addValidator(HasMaxLenValidator(min), message);
  }

  void hasMinLen(int max, String message) {
    _addValidator(HasMinLenValidator(max), message);
  }

  void isSpace(String message) {
    _addValidator(SpaceValidator(), message);
  }

  void constains(String value, String message) {
    _addValidator(ContainsValidator(value), message);
  }

  void isNotEmpty(String message) {
    _addValidator(NotEmptyValidator(), message);
  }

  void isEmpty(String message) {
    _addValidator(EmptyValidator(), message);
  }

  void notIsEmpty(String message) {
    _addValidator(NotEmptyValidator(), message);
  }
}
