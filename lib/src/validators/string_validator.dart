import 'package:flunt_dart/src/validations/contracts/validatable.dart';
import 'package:flunt_dart/src/validators/object_validator.dart';

class SpaceValidator implements IValidate<String> {
  SpaceValidator();

  @override
  bool validate(String value) {
    return _hasOnySpaces(value);
  }

  bool _hasOnySpaces(String value) {
    var result = true;

    value.codeUnits.forEach((value) {
      if (value != " ".codeUnitAt(0)) {
        result = false;
      }
    });

    return result;
  }
}

class EmptyValidator implements IValidate<String> {
  EmptyValidator();

  @override
  bool validate(String value) {
    return (value.isEmpty);
  }
}

class NotEmptyValidator implements IValidate<String> {
  NotEmptyValidator();

  @override
  bool validate(String value) {
    return (value.isNotEmpty);
  }
}

class NotNullOrEmptyValidator implements IValidate<String> {
  NotNullOrEmptyValidator();

  @override
  bool validate(String value) {
    var isNotNull = NotEmptyValidator().validate(value);
    return (isNotNull || value.isNotEmpty);
  }
}

class NullOrEmptyValidator implements IValidate<String> {
  NullOrEmptyValidator();

  @override
  bool validate(String value) {
    var isNotNull = NullValidator().validate(value);
    return (isNotNull || value.isNotEmpty);
  }
}

// 5
// 12345

class HasMinLenValidator implements IValidate<String> {
  final int min;
  HasMinLenValidator(this.min);

  @override
  bool validate(String value) {
    return (value.length >= min);
  }
}

class HasMaxLenValidator implements IValidate<String> {
  final int max;
  HasMaxLenValidator(this.max);

  @override
  bool validate(String value) {
    return !(value.length > max);
  }
}

class HasExactLengthValidator implements IValidate<String> {
  final int length;
  HasExactLengthValidator(this.length);

  @override
  bool validate(String value) {
    return (value.length == length);
  }
}

class ContainsValidator implements IValidate<String> {
  final String text;
  ContainsValidator(this.text);

  @override
  bool validate(String value) {
    return (value.contains(text));
  }
}
