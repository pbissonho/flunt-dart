import 'package:flunt_dart/src/validations/contracts/contract.dart';
import 'package:flunt_dart/src/validators/string_validator.dart';

mixin StringValidation<T> implements IContract {
  void hasLen(int length, String message) {
    withValidator(HasExactLengthValidator(length), message);
  }

  void hasMaxLen(int max, String message) {
    withValidator(HasMaxLenValidator(max), message);
  }

  void hasMinLen(int min, String message) {
    withValidator(HasMinLenValidator(min), message);
  }

  void isWhiteSpace(String message) {
    withValidator(SpaceValidator(), message);
  }

  void constains(String value, String message) {
    withValidator(ContainsValidator(value), message);
  }

  void isNotEmpty(String message) {
    withValidator(NotEmptyValidator(), message);
  }

  void isEmpty(String message) {
    withValidator(EmptyValidator(), message);
  }

  void notIsEmpty(String message) {
    withValidator(NotEmptyValidator(), message);
  }
}
