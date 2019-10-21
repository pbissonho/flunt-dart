import 'package:flunt_dart/src/validations/contracts/validatable.dart';

class NumEqualsValidator implements IValidate<num> {
  final num comparer;

  NumEqualsValidator(this.comparer);

  @override
  bool validate(num value) {
    return (value == comparer);
  }
}

class GreaterThanValidator implements IValidate<num> {
  final num comparer;

  GreaterThanValidator(this.comparer);

  @override
  bool validate(num value) {
    return (value > comparer);
  }
}

class LowerThanValidator implements IValidate<num> {
  final num comparer;

  LowerThanValidator(this.comparer);

  @override
  bool validate(num value) {
    return (value < comparer);
  }
}

class BetweenValidator implements IValidate<num> {
  final num from;
  final num to;

  BetweenValidator(this.from, this.to);

  @override
  bool validate(num value) {
    return ((value >= from && value <= to));
  }
}

class NotEqualsBetweenValidator implements IValidate<num> {
  final num comparer;

  NotEqualsBetweenValidator(this.comparer);

  @override
  bool validate(num value) {
    return (value != comparer);
  }
}
