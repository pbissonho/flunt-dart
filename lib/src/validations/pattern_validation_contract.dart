import 'package:flunt_dart/src/validations/contracts/contract.dart';
import 'package:flunt_dart/src/validators/pattern_validator.dart';

mixin PatternValidation<T> implements IContract {
  void matchs(String pattern, String message) {
    withValidator(MatchsValidator(pattern), message);
  }

  void isUrl(String message) {
    withValidator(UrlValidator(), message);
  }

  void isEmail(String message) {
    withValidator(EmailValidator(), message);
  }

  void isDigit(String message) {
    withValidator(DigitValidator(), message);
  }
}
