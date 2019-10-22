import 'package:flunt_dart/src/validations/contracts/validatable.dart';

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

class NotBetweenValidator implements IValidate<num> {
  final num from;
  final num to;

  NotBetweenValidator(this.from, this.to);

  @override
  bool validate(num value) {
    return !BetweenValidator(from, to).validate(value);
  }
}
