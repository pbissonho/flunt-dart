import 'package:flunt_dart/src/validations/contracts/validatable.dart';

class MatchsValidator implements IValidate<String> {
  final String pattern;

  MatchsValidator(this.pattern);

  @override
  bool validate(String value) {
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? "");
  }
}

class EmailValidator implements IValidate<String> {
  EmailValidator();
  final String pattern = r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
  @override
  bool validate(String value) {
    return MatchsValidator(pattern).validate(value);
  }
}

class UrlValidator implements IValidate<String> {
  final String pattern =
      r"^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$";

  UrlValidator();

  @override
  bool validate(String value) {
    return MatchsValidator(pattern).validate(value);
  }
}

class DigitValidator implements IValidate<String> {
  final String pattern = r"^\d+$";

  DigitValidator();

  @override
  bool validate(String value) {
    return MatchsValidator(pattern).validate(value);
  }
}
