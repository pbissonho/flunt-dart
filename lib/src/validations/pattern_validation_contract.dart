import 'package:flunt_dart/src/validations/contracts/contract.dart';
import 'package:flunt_dart/src/validators/pattern_validator.dart';

mixin PatternValidation<T> implements IRule {
  void matchs(String pattern, String message) {
    addValidator(MatchsValidator(pattern), message);
  }

  void isUrl(String message) {
    addValidator(UrlValidator(), message);
  }

  void isEmail(String message) {
    addValidator(EmailValidator(), message);
  }

  void isDigit(String message) {
    addValidator(DigitValidator(), message);
  }
}
