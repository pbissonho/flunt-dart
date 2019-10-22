import 'package:flunt_dart/src/validators/num_validator.dart';

import 'contracts/contract.dart';

mixin NumValidation<T> implements IContract {
  void isGreaterThan(int compare, String message) {
    withValidator(GreaterThanValidator(compare), message);
  }

  void isLowerThan(int compare, String message) {
    withValidator(LowerThanValidator(compare), message);
  }

  void between(num from, num to, String message) {
    withValidator(BetweenValidator(from, to), message);
  }

  void notBetween(num from, num to, String message) {
    withValidator(NotBetweenValidator(from, to), message);
  }
}
