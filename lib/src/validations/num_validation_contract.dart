import 'package:flunt_dart/src/validations/contracts/validatable.dart';
import 'package:flunt_dart/src/validators/num_validator.dart';

mixin NumValidation<T> implements IValidatable {
  void _addValidator(IValidate validate, message);

  void isGreaterThan(int compare, String message) {
    _addValidator(GreaterThanValidator(compare), message);
  }

  void isLowerThanThan(int compare, String message) {
    _addValidator(LowerThanValidator(compare), message);
  }

  void between(num from, num to, String message) {
    _addValidator(BetweenValidator(from, to), message);
  }
}
