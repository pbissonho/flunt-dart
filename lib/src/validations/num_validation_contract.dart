import 'package:flunt_dart/src/validators/num_validator.dart';

import 'contracts/contract.dart';

mixin NumValidation<T> implements IRule {
  void isGreaterThan(int compare, String message) {
    addValidator(GreaterThanValidator(compare), message);
  }

  void isLowerThanThan(int compare, String message) {
    addValidator(LowerThanValidator(compare), message);
  }

  void between(num from, num to, String message) {
    addValidator(BetweenValidator(from, to), message);
  }
}
