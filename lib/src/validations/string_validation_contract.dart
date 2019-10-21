import 'package:flunt_dart/src/validations/contracts/contract.dart';
import 'package:flunt_dart/src/validators/string_validator.dart';

mixin StringValidation<T> implements IRule {
  void exactLen(int length, String message) {
    addValidator(HasExactLengthValidator(length), message);
  }

  void hasMaxLen(int max, String message) {
    addValidator(HasMaxLenValidator(max), message);
  }

  void hasMinLen(int min, String message) {
    addValidator(HasMinLenValidator(min), message);
  }

  void isSpace(String message) {
    addValidator(SpaceValidator(), message);
  }

  void constains(String value, String message) {
    addValidator(ContainsValidator(value), message);
  }

  void isNotEmpty(String message) {
    addValidator(NotEmptyValidator(), message);
  }

  void isEmpty(String message) {
    addValidator(EmptyValidator(), message);
  }

  void notIsEmpty(String message) {
    addValidator(NotEmptyValidator(), message);
  }
}
