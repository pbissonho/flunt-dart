import 'package:flunt_dart/src/validations/contracts/validatable.dart';
import 'package:flunt_dart/src/validators/pattern_validator.dart';

mixin PatternValidation<T> implements IValidatable {
  void _addValidator(IValidate validate, message);

  void matchs(String pattern, String message) {
    _addValidator(MatchsValidator(pattern), message);
  }

  void isUrl(String message) {
    _addValidator(UrlValidator(), message);
  }

  void isEmail(String message) {
    _addValidator(EmailValidator(), message);
  }

  void isDigit(String message) {
    _addValidator(DigitValidator(), message);
  }
}
