import 'package:flunt_dart/src/validations/contracts/validatable.dart';

class EqualsValidator implements IValidate<Object> {
  final Object comparer;

  EqualsValidator(this.comparer);

  @override
  bool validate(Object value) {
    return (value == comparer);
  }
}

class NullValidator implements IValidate<Object> {
  @override
  bool validate(Object value) {
    return (value == null);
  }
}

class NotNullValidator implements IValidate<Object> {
  @override
  bool validate(Object value) {
    if (value != null) return true;
    return false;
  }
}

class WhenValidator<T> implements IValidate<T> {
  final bool Function(T value) whenFunction;

  WhenValidator(this.whenFunction);

  @override
  bool validate(T value) {
    return whenFunction(value);
  }
}
